view: health_messages_monthly_activity {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
          accounts.id as account_id
        , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', accounts.confirmed_at) MONTH) as signup_month
        , month_list.message_month as message_month
        , COALESCE(data_x.monthly_messages, 0) as monthly_messages
        ,(@row_number:=@row_number + 1) AS num
      FROM
       (SELECT @row_number:=0) AS t, accounts
      LEFT JOIN
        (
          SELECT
           DISTINCT(date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', m.message_date) MONTH)) as message_month
          FROM ${messages.SQL_TABLE_NAME} m
        ) as month_list
      ON month_list.message_month >= date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', accounts.confirmed_at) MONTH)
      LEFT JOIN
        (
          SELECT
                m.account_id
              , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', m.message_date) MONTH) as message_month
              , COUNT(distinct m.messages_key) AS monthly_messages
          FROM ${messages.SQL_TABLE_NAME} m
          GROUP BY 1,2
        ) as data_x
      ON data_x.message_month = month_list.message_month
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

  dimension: message_month {
    type: string
    sql: ${TABLE}.message_month ;;
  }

  dimension: monthly_messages {
    type: number
    sql: ${TABLE}.monthly_messages ;;
  }

  dimension: num {
    type: number
    sql: ${TABLE}.num ;;
  }

  set: detail {
    fields: [account_id, signup_month, message_month, monthly_messages, num]
  }
}
