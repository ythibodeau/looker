view: active_users_messaging {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    indexes: ["account_id", "xdate"]
    sql: SELECT daily_use.account_id,
       -- CONVERT_TZ(wd.day_date, 'UTC','America/New_York') as xdate,
       wd.day_date as xdate,
       MIN(DATEDIFF(wd.day_date, daily_use.action_date)) as days_since_last_action
FROM ${date_series_table_light.SQL_TABLE_NAME} as wd
LEFT JOIN (
SELECT ma.account_id, DATE_FORMAT(CONVERT_TZ(ma.action_date, 'UTC','America/New_York'), '%Y-%m-%d') as action_date
FROM ${hlth_messaging_actions.SQL_TABLE_NAME} ma
WHERE YEAR(ma.action_date) >= 2019) as daily_use
ON wd.day_date BETWEEN daily_use.action_date AND DATE_ADD(daily_use.action_date, INTERVAL 30 DAY)
GROUP BY 1,2 ;;
  }

  dimension_group: date {
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
    label: "mau"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [detail*]
  }

  measure: user_count_active_this_day {
    label: "dau"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [detail*]

    filters: {
      field: active_this_day
      value: "yes"
    }
  }

  measure: user_count_active_7_days {
    label: "wau"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [detail*]

    filters: {
      field: active_last_7_days
      value: "yes"
    }
  }
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      accounts.first_name,
      accounts.last_name,
      accounts.state_nice,
      accounts.last_active_date,
      accounts.simplified_kind,
      accounts.groups_acronym,
      accounts.institutions
    ]
  }
}
