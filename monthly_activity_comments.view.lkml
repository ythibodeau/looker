view: monthly_activity_comments {
 derived_table: {
  sql_trigger_value: select CURDATE() ;;
  indexes: ["account_id", "signup_month", "comment_month"]
  sql:
  SELECT
          accounts.id as account_id
        , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', accounts.confirmed_at) MONTH) as signup_month
        , month_list.comment_month as comment_month
        , COALESCE(data_x.monthly_comments, 0) as monthly_comments
        ,(@row_number:=@row_number + 1) AS num
      FROM
       (SELECT @row_number:=0) AS t, accounts
      LEFT JOIN
        (
          SELECT
           DISTINCT(date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', c.created_at) MONTH)) as comment_month
          FROM comments c
          INNER JOIN discussions d on d.id = c.discussion_id
          WHERE d.topic_type IS NULL
        ) as month_list
      ON month_list.comment_month >= date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', accounts.confirmed_at) MONTH)
      LEFT JOIN
        (
          SELECT
                c.account_id
              , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', c.created_at) MONTH) as comment_month
              , COUNT(distinct c.id) AS monthly_comments
          FROM comments c
          INNER JOIN discussions d on d.id = c.discussion_id
          WHERE d.topic_type IS NULL
          GROUP BY 1,2
        ) as data_x
      ON data_x.comment_month = month_list.comment_month
      AND data_x.account_id = accounts.id
           ;;
}

  dimension: num {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.num ;;
  }

dimension: account_id {
  type: number
  sql: ${TABLE}.account_id ;;
}

dimension_group: signup {
  type: time
  timeframes: [date, month]
  sql: ${TABLE}.signup_month ;;
}

dimension_group: comment_month {
  type: time
  timeframes: [month]
  sql: ${TABLE}.comment_month ;;
}

dimension: months_since_signup {
  type: number
  sql: TIMESTAMPDIFF(MONTH, ${TABLE}.signup_month, ${TABLE}.comment_month) ;;
}

# dimension: time_to_10_messages {
#   type: number
#   sql:  TIMESTAMPDIFF(MONTH, ${TABLE}.signup_month, ${TABLE}.comment_month) ;;
# }

dimension: monthly_comments {
  type: number
  sql: ${TABLE}.monthly_comments ;;
}

measure: total_users {
  type: count_distinct
  sql: ${account_id} ;;
  drill_fields: [accounts.id, accounts.first_name, accounts.last_name]
}

measure: total_active_users {
  type: count_distinct
  sql: ${account_id} ;;
  drill_fields: [accounts.id, accounts.first_name, accounts.last_name]

  filters: {
    field: monthly_comments
    value: ">0"
  }
}

measure: total_active_users_reached_d10m {
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.first_name, accounts.last_name]

    filters: {
      field: monthly_comments
      value: ">9"
    }
  }

measure: percent_of_cohort_active {
  type: number
  value_format_name: percent_1
  sql: 1.0 * ${total_active_users} / nullif(${total_users},0) ;;
  drill_fields: [account_id, monthly_comments]
}

  # CURRENT if Yes
  # SLEEPING if No
#   dimension: current {
#     type: yesno
#     sql: ${account_id} IN (SELECT ${account_id} FROM ${monthly_activity_comments.SQL_TABLE_NAME} WHERE ${monthly_comments} > 0)
#          AND
#          ${account_id} IN (SELECT ${account_id} FROM ${monthly_activity_comments.SQL_TABLE_NAME} WHERE DATE_ADD(${comment_month_month}, INTERVAL -1 MONTH) AND ${monthly_comments} > 0) ;;
#   }

#   dimension: sleeping {
#     type: yesno
#     sql: ${account_id} NOT IN (SELECT ${account_id} FROM ${TABLE} WHERE ${created_month} = ${year_month_table.year_month})
#          AND
#          ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE TIMESTAMPDIFF(MONTH, ${year_month_table.year_month}, ${created_month}) >= 1) ;;
#   }
#
#   # resuscitated if Yes
#   dimension: resuscitated {
#     type: yesno
#     sql: ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE ${created_month} = ${year_month_table.year_month})
#           AND
#           ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE TIMESTAMPDIFF(MONTH, ${year_month_table.year_month}, ${created_month}) > 1) ;;
#   }
#
#   dimension: new {
#     type: yesno
#     sql: ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE ${created_month} = ${year_month_table.year_month})
#          AND
#          ${account_id} NOT IN (SELECT ${account_id} FROM ${TABLE} WHERE TIMESTAMPDIFF(MONTH, ${year_month_table.year_month}, ${created_month}) >= 1) ;;
#   }

  measure: current_total {
    type: count
    filters: {
      field: current
      value: "Yes"
    }
  }

#   measure: sleeping_total {
#     type: count
#     filters: {
#       field: sleeping
#       value: "Yes"
#     }
#   }
#
#   measure: resuscitated_total {
#     type: count
#     filters: {
#       field: resuscitated
#       value: "yes"
#     }
#   }
#
#   measure: new_total {
#     type: count
#     filters: {
#       field: new
#       value: "yes"
#     }
#   }


}
