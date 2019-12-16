view: health_messages_previous_monthly_activity {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
          CONCAT(date_format(MAC.message_month, '%Y-%m'), "-", CAST(MAC.account_id as CHAR)) as mapc_key
        , date_format(MAC.message_month, '%Y-%m') as message_month
        , MAC.account_id as account_id
        , MAC.monthly_messages
        , date_format(max(months_with_messages.month_with_message), '%Y-%m') as previous_message_month
      FROM
        ${health_messages_monthly_activity.SQL_TABLE_NAME} MAC
        LEFT JOIN (
          SELECT
              a1.message_month as month_with_message
            , a1.account_id as account_id
          FROM
             ${health_messages_monthly_activity.SQL_TABLE_NAME} a1
          WHERE
            a1.monthly_messages > 0
          ) months_with_messages
          on MAC.account_id = months_with_messages.account_id
          and extract(year_month from MAC.message_month) > extract(year_month from months_with_messages.month_with_message)
          WHERE MAC.message_month IS NOT NULL
      GROUP BY
        message_month, account_id, monthly_messages
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: mapc_key {
    primary_key: yes
    type: string
    sql: ${TABLE}.mapc_key ;;
  }

  dimension: message_month {
    type: string
    sql: ${TABLE}.message_month ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: monthly_messages {
    type: number
    sql: ${TABLE}.monthly_messages ;;
  }

  dimension: previous_message_month {
    type: string
    sql: ${TABLE}.previous_message_month ;;
  }

  set: detail {
    fields: [mapc_key, message_month, account_id, monthly_messages, previous_message_month]
  }
}
