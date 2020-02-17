view: active_users_messaging {
  derived_table: {
    indexes: ["account_id", "xdate"]
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT sa.account_id,
      wd.day_date as xdate,
      MIN(DATEDIFF(wd.day_date, sa.action_date)) as days_since_last_action
FROM ${date_series_table.SQL_TABLE_NAME} as wd
LEFT JOIN ${messaging_actions.SQL_TABLE_NAME} as sa
ON wd.day_date BETWEEN sa.action_date AND DATE_ADD(sa.action_date, INTERVAL 30 DAY)
GROUP BY 1,2;
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: xdate {
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
    label: "MAU"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.name]
  }

  measure: user_count_active_this_day {
    label: "DAU"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.name]

    filters: {
      field: active_this_day
      value: "yes"
    }
  }

  measure: user_count_active_7_days {
    label: "WAU"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.name]

    filters: {
      field: active_last_7_days
      value: "yes"
    }
  }

  measure: count_unique_accounts {
    type: count_distinct
    sql: ${account_id} ;;
  }

  set: detail {
    fields: [account_id, xdate_date, days_since_last_action]
  }
}
