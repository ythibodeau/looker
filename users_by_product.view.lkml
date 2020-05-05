view: users_by_product {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT A.id,
                A.state,
    CASE
          WHEN AK.id IN (1,14,17) THEN "Doctor"
          WHEN AK.id IN (2, 9, 11, 12, 13, 15, 16) THEN "Resident"
          WHEN AK.id = 7  THEN "HCP"
          WHEN AK.id IN (5,6) THEN "Assistant"
          ELSE "Other"
    END as simplified_kind,
    X.code,
    X.date_serie FROM
          (
          SELECT DISTINCT ACTIVE_ACCOUNTS_GROUPS.account_id as account_id, GROUP_PLANS.code as code, ACTIVE_ACCOUNTS_GROUPS.date_serie FROM groups G
          INNER JOIN (
              SELECT DISTINCT G.id, CASE PS.code WHEN 'hospital' THEN 'md_schedule' ELSE PS.code END as code, start_time as date_serie FROM groups G
              INNER JOIN groups_pricing_plans GPP ON GPP.group_id = G.id
              INNER JOIN pricing_plans PP ON PP.id = GPP.plan_id
              INNER JOIN pricing_suites PS ON PS.id = PP.suite_id
              CROSS JOIN ${month_series_table.SQL_TABLE_NAME}
              WHERE (start_date IS NULL OR start_date <= end_time)
              AND (end_date IS NULL OR end_date >= start_time) AND trial = 0
          ) GROUP_PLANS ON GROUP_PLANS.id = G.id
          INNER JOIN (
              SELECT DISTINCT MC.account_id, MC.group_id, date_serie FROM membership_changes MC
              INNER JOIN (
                  SELECT MC.id, date_serie FROM membership_changes MC
                  INNER JOIN (
                      SELECT MAX(MC.id) as id, start_time as date_serie FROM membership_changes MC
                      CROSS JOIN ${month_series_table.SQL_TABLE_NAME}
                      WHERE MC.created_at <= start_time
                      GROUP BY group_id, account_id, start_time
                  ) MAX_MC ON MAX_MC.id = MC.id
                  INNER JOIN membership_change_kinds MCK ON MCK.id = MC.kind_id
                  WHERE MC.kind_id IN (1,3)
                  UNION
                  SELECT MC.id, start_time as date_serie FROM membership_changes MC
                  CROSS JOIN ${month_series_table.SQL_TABLE_NAME}
                  WHERE MC.created_at BETWEEN start_time AND end_time
              ) QUARTER_ACTIVE ON QUARTER_ACTIVE.id = MC.id
          ) ACTIVE_ACCOUNTS_GROUPS ON ACTIVE_ACCOUNTS_GROUPS.group_id = GROUP_PLANS.id AND GROUP_PLANS.date_serie = ACTIVE_ACCOUNTS_GROUPS.date_serie
          ) X
            INNER JOIN accounts A ON A.id = X.account_id
          INNER JOIN account_kinds AK on AK.id = A.kind_id;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: number_of_unique_accounts {
    type: count_distinct
    sql: ${TABLE}.id ;;
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.id, ${TABLE}.code, ${TABLE}.date_serie) ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: simplified_kind {
    type: string
    sql: ${TABLE}.simplified_kind ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
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
    convert_tz: no
  }

  set: detail {
    fields: [id, simplified_kind, code]
  }
}
