view: monthly_activity_chats {
  derived_table: {
    sql: SELECT
          accounts.id as account_id
        , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', accounts.confirmed_at) MONTH) as signup_month
        , month_list.chat_month as chat_month
        , COALESCE(data_x.monthly_chats, 0) as monthly_chats
        ,(@row_number:=@row_number + 1) AS num
      FROM
       (SELECT @row_number:=0) AS t, accounts
      LEFT JOIN
        (
          SELECT
           DISTINCT(date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', M.created_at) MONTH)) as chat_month
          FROM mess__messages M
          INNER JOIN mess__conversers C on C.id = M.converser_id
          WHERE message_type IN (0,1)
        ) as month_list
      ON month_list.chat_month >= date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', accounts.confirmed_at) MONTH)
      LEFT JOIN
        (
          SELECT
                C.account_id
              , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', M.created_at) MONTH) as chat_month
              , COUNT(distinct M.id) AS monthly_chats
          FROM mess__messages M
          INNER JOIN mess__conversers C on C.id = M.converser_id
          WHERE message_type IN (0,1)
          GROUP BY 1,2
        ) as data_x
      ON data_x.chat_month = month_list.chat_month
      AND data_x.account_id = accounts.id
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

  dimension: signup_month {
    type: string
    sql: ${TABLE}.signup_month ;;
  }

  dimension: chat_month {
    type: string
    sql: ${TABLE}.chat_month ;;
  }

  dimension: monthly_chats {
    type: number
    sql: ${TABLE}.monthly_chats ;;
  }

  dimension: num {
    type: number
    sql: ${TABLE}.num ;;
  }

  set: detail {
    fields: [account_id, signup_month, chat_month, monthly_chats, num]
  }
}
