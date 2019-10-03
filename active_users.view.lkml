view: active_users {
  derived_table: {
    sql_trigger_value: SELECT CURDATE();;
    indexes: ["xdate"]
    sql: SELECT daily_use.account_id,
       wd.day_date as xdate,
       MIN(DATEDIFF(wd.day_date, daily_use.comment_date)) as days_since_last_action
FROM ${date_series_table.SQL_TABLE_NAME} as wd
LEFT JOIN (
SELECT DISTINCT c.account_id, DATE_FORMAT(c.created_at, '%Y-%m-%d') as comment_date
FROM comments c
INNER JOIN discussions d on d.id = c.discussion_id
WHERE YEAR(c.created_at) >= 2018 and d.topic_type is null) as daily_use
ON wd.day_date BETWEEN daily_use.comment_date AND DATE_ADD(daily_use.comment_date, INTERVAL 30 DAY)
GROUP BY 1,2
       ;;
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
