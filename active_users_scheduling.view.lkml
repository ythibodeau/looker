view: active_users_scheduling {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT daily_use.account_id,
      wd.date as xdate,
      MIN(DATEDIFF(wd.date, sa.action_date)) as days_since_last_action
FROM ${date_series_table.SQL_TABLE_NAME} as wd
LEFT JOIN ${scheduling_actions.SQL_TABLE_NAME} as sa
ON wd.date BETWEEN sa.action_date AND DATE_ADD(sa.action_date, INTERVAL 30 DAY)


GROUP BY 1,2;
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: xdate {
    type: date
    sql: ${TABLE}.xdate ;;
  }

  dimension: active_this_day {
    type: yesno
    sql: ${days_since_last_action} <  1 ;;
  }

  dimension: active_last_7_days {
    type: yesno
    sql: ${days_since_last_action} < 7 ;;
  }

  dimension: days_since_last_action {
    type: number
    sql: ${TABLE}.days_since_last_action ;;
  }

  measure: user_count_active_30_days {
    label: "Monthly Active Users"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.name]
  }

  measure: user_count_active_this_day {
    label: "Daily Active Users"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.name]

    filters: {
      field: active_this_day
      value: "yes"
    }
  }

  measure: user_count_active_7_days {
    label: "Weekly Active Users"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.name]

    filters: {
      field: active_last_7_days
      value: "yes"
    }
  }

  set: detail {
    fields: [account_id, xdate, days_since_last_action]
  }
}
