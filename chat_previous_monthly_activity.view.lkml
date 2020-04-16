view: chat_previous_monthly_activity {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
          CONCAT(date_format(MAC.chat_month, '%Y-%m'), "-", CAST(MAC.account_id as CHAR)) as mapc_key
        , date_format(MAC.chat_month, '%Y-%m') as chat_month
        , MAC.account_id as account_id
        , MAC.monthly_chats
        , date_format(max(months_with_chats.month_with_chat), '%Y-%m') as previous_chat_month
      FROM
        ${chats_monthly_activity.SQL_TABLE_NAME} MAC
        LEFT JOIN (
          SELECT
              a1.chat_month as month_with_chat
            , a1.account_id as account_id
          FROM
             ${chats_monthly_activity.SQL_TABLE_NAME} a1
          WHERE
            a1.monthly_chats > 0
          ) months_with_chats
          on MAC.account_id = months_with_chats.account_id
          and extract(year_month from MAC.chat_month) > extract(year_month from months_with_chats.month_with_chat)
          WHERE MAC.chat_month IS NOT NULL
      GROUP BY
        chat_month, account_id, monthly_chats
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

  dimension: chat_month {
    type: string
    sql: ${TABLE}.chat_month ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: monthly_chats {
    type: number
    sql: ${TABLE}.monthly_chats ;;
  }

  dimension: previous_chat_month {
    type: string
    sql: ${TABLE}.previous_chat_month ;;
  }

  set: detail {
    fields: [mapc_key, chat_month, account_id, monthly_chats, previous_chat_month]
  }
}
