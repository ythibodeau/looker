view: account_highest_scheduling_plans {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT M.account_id as account_id,
          MAX(highest_plan) as pp_code,
          CASE MAX(highest_plan)
            WHEN 1 THEN "basic_sched"
            WHEN 2 THEN "standard_sched"
            WHEN 3 THEN "advanced_sched"
          END as plan_value
          FROM ${group_highest_scheduling_plans.SQL_TABLE_NAME}
          INNER JOIN memberships M ON M.group_id = ${group_highest_scheduling_plans.SQL_TABLE_NAME}.group_id
          GROUP BY M.account_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: accounts_count {
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [detail*]
  }

  dimension: account_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: pp_code {
    type: number
    sql: ${TABLE}.pp_code ;;
  }

  dimension: plan_value {
    type: string
    sql: ${TABLE}.plan_value ;;
  }

  set: detail {
    fields: [account_id, accounts.full_name, account_kinds.mnemonic, accounts.groups_acronym]
  }
}
