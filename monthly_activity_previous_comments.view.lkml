view: monthly_activity_previous_comments {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    indexes: ["mapc_key"]
    sql: SELECT
          CONCAT(date_format(MAC.comment_month, '%Y-%m'), "-", CAST(MAC.account_id as CHAR)) as mapc_key
        , date_format(MAC.comment_month, '%Y-%m') as comment_month
        , MAC.account_id as account_id
        , MAC.monthly_comments
        , date_format(max(months_with_comments.month_with_comment), '%Y-%m') as previous_comment_month
      FROM
        ${monthly_activity_comments.SQL_TABLE_NAME} MAC
        LEFT JOIN (
          SELECT
              a1.comment_month as month_with_comment
            , a1.account_id as account_id
          FROM
             ${monthly_activity_comments.SQL_TABLE_NAME} a1
          WHERE
            a1.monthly_comments > 0
          ) months_with_comments
          on MAC.account_id = months_with_comments.account_id
          and extract(year_month from MAC.comment_month) > extract(year_month from months_with_comments.month_with_comment)
          WHERE MAC.comment_month IS NOT NULL
      GROUP BY
        comment_month, account_id, monthly_comments
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: mapc_key {
    primary_key: yes
    type: string
    sql: ${TABLE}.mapc_key;;
  }

  dimension: comment_month {
    type: string
    sql: ${TABLE}.comment_month ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: monthly_comments {
    type: number
    sql: ${TABLE}.monthly_comments ;;
  }

  dimension: previous_comment_month {
    type: string
    sql: ${TABLE}.previous_comment_month ;;
  }


  set: detail {
    fields: [comment_month, account_id, monthly_comments, previous_comment_month]
  }
}
