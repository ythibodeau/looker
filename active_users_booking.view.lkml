view: active_users_booking {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT daily_use.account_id,
       wd.day_date as xdate,
       MIN(DATEDIFF(wd.day_date, daily_use.action_date)) as days_since_last_action
FROM ${date_series_table_light.SQL_TABLE_NAME} as wd
LEFT JOIN (
SELECT ma.account_id, DATE_FORMAT(CONVERT_TZ(ma.action_date, 'UTC','America/New_York'), '%Y-%m-%d') as action_date
FROM ${booking_actions.SQL_TABLE_NAME} ma
WHERE YEAR(ma.action_date) >= 2019) as daily_use
ON wd.day_date BETWEEN daily_use.action_date AND DATE_ADD(daily_use.action_date, INTERVAL 30 DAY)
GROUP BY 1,2
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

  dimension_group: xdate {
    type: time
    timeframes: [
      date,
      time,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.xdate ;;
    convert_tz: no
  }

  dimension: days_since_last_action {
    type: number
    sql: ${TABLE}.days_since_last_action ;;
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
    drill_fields: [accounts.id, accounts.full_name]
  }

  measure: user_count_active_this_day {
    label: "Daily Active Users"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.full_name]

    filters: {
      field: active_this_day
      value: "yes"
    }
  }

  measure: user_count_active_7_days {
    label: "Weekly Active Users"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.full_name]

    filters: {
      field: active_last_7_days
      value: "yes"
    }
  }

  set: detail {
    fields: [account_id, xdate_date, days_since_last_action]
  }
}
