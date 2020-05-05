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


  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: active_users_messaging {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
