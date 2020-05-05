view: health_booking_previous_monthly_activity {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
          CONCAT(date_format(MAC.booking_action_month, '%Y-%m'), "-", CAST(MAC.account_id as CHAR)) as mapc_key
        , date_format(MAC.booking_action_month, '%Y-%m') as action_month
        , MAC.account_id as account_id
        , MAC.monthly_actions
        , date_format(max(months_with_actions.month_with_action), '%Y-%m') as previous_action_month
      FROM
        ${health_booking_monthly_activity.SQL_TABLE_NAME} MAC
        LEFT JOIN (
          SELECT
              a1.booking_action_month as month_with_action
            , a1.account_id as account_id
          FROM
             ${health_booking_monthly_activity.SQL_TABLE_NAME} a1
          WHERE
            a1.monthly_actions > 0
          ) months_with_actions
          on MAC.account_id = months_with_actions.account_id
          and extract(year_month from MAC.booking_action_month) > extract(year_month from months_with_actions.month_with_action)
          WHERE MAC.booking_action_month IS NOT NULL
      GROUP BY
        booking_action_month, account_id, monthly_actions
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: mapc_key {
    type: string
    sql: ${TABLE}.mapc_key ;;
  }

  dimension: action_month {
    type: string
    sql: ${TABLE}.action_month ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: monthly_actions {
    type: number
    sql: ${TABLE}.monthly_actions ;;
  }

  dimension: previous_action_month {
    type: string
    sql: ${TABLE}.previous_action_month ;;
  }

  set: detail {
    fields: [mapc_key, action_month, account_id, monthly_actions, previous_action_month]
  }
}
