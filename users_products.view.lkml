view: users_products {
  derived_table: {
    sql_trigger_value: select CURDATE() ;;
    sql: SELECT code, date_serie, COUNT(account_id) as total FROM (
    SELECT DISTINCT ACTIVE_ACCOUNTS_GROUPS.account_id as account_id, GROUP_PLANS.code as code, ACTIVE_ACCOUNTS_GROUPS.date_serie FROM groups G
    INNER JOIN (
        SELECT DISTINCT G.id, CASE PS.code WHEN 'hospital' THEN 'md_schedule' ELSE PS.code END as code, quarter_start_date as date_serie FROM groups G
        INNER JOIN groups_pricing_plans GPP ON GPP.group_id = G.id
        INNER JOIN pricing_plans PP ON PP.id = GPP.plan_id
        INNER JOIN pricing_suites PS ON PS.id = PP.suite_id
        CROSS JOIN ${date_series_quarters.SQL_TABLE_NAME}
        WHERE (start_date IS NULL OR start_date <= DATE_ADD(DATE_ADD(quarter_start_date, INTERVAL +3 MONTH), INTERVAL -1 SECOND))
        AND (end_date IS NULL OR end_date >= quarter_start_date) AND trial = 0
    ) GROUP_PLANS ON GROUP_PLANS.id = G.id
    INNER JOIN (
        SELECT DISTINCT MC.account_id, MC.group_id, date_serie FROM membership_changes MC
        INNER JOIN (
            SELECT MC.id, date_serie FROM membership_changes MC
            INNER JOIN (
                SELECT MAX(MC.id) as id, quarter_start_date as date_serie FROM membership_changes MC
                CROSS JOIN ${date_series_quarters.SQL_TABLE_NAME}
                WHERE MC.created_at <= quarter_start_date
                GROUP BY account_id, quarter_start_date
            ) MAX_MC ON MAX_MC.id = MC.id
            INNER JOIN membership_change_kinds MCK ON MCK.id = MC.kind_id
            INNER JOIN accounts A ON A.id = MC.account_id
            WHERE MC.kind_id = 3
            UNION
            SELECT MC.id, quarter_start_date as date_serie FROM membership_changes MC
            CROSS JOIN ${date_series_quarters.SQL_TABLE_NAME}
            WHERE MC.created_at BETWEEN quarter_start_date AND DATE_ADD(DATE_ADD(quarter_start_date, INTERVAL +3 MONTH), INTERVAL -1 SECOND)
        ) QUARTER_ACTIVE ON QUARTER_ACTIVE.id = MC.id
    ) ACTIVE_ACCOUNTS_GROUPS ON ACTIVE_ACCOUNTS_GROUPS.group_id = GROUP_PLANS.id AND GROUP_PLANS.date_serie = ACTIVE_ACCOUNTS_GROUPS.date_serie
) A
GROUP BY code, A.date_serie;;

  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension_group: date_serie {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_serie ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
  }

  measure: total_users {
    type: number
    sql: ${TABLE}.total ;;
  }

  set: detail {
    fields: [code, date_serie, total]
  }
}
