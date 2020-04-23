view: active_users {
  derived_table: {
    sql_trigger_value: SELECT CURDATE();;
    indexes: ["xdate"]
    sql:  SELECT daily_use.account_id,
       CONVERT_TZ(wd.day_date, 'UTC','America/New_York') as xdate,
       MIN(DATEDIFF(wd.day_date, daily_use.message_date)) as days_since_last_action
FROM ${date_series_table.SQL_TABLE_NAME} as wd
LEFT JOIN (
SELECT m.account_id, DATE_FORMAT(CONVERT_TZ(m.message_date, 'UTC','America/New_York'), '%Y-%m-%d') as message_date
FROM ${messages.SQL_TABLE_NAME} m
WHERE YEAR(m.message_date) >= 2019) as daily_use
ON wd.day_date BETWEEN daily_use.message_date AND DATE_ADD(daily_use.message_date, INTERVAL 30 DAY)
GROUP BY 1,2;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.xdate ;;
    convert_tz: no
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: days_since_last_action {
    type: number
    sql: ${TABLE}.days_since_last_action ;;
    value_format_name: decimal_0
  }

  dimension: active_this_day {
    type: yesno
    sql: ${days_since_last_action} <  1 ;;
  }

  dimension: active_last_7_days {
    type: yesno
    sql: ${days_since_last_action} < 7 ;;
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
}
