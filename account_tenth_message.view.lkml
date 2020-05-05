view: account_tenth_message {
  derived_table: {
    sql: SELECT
      M.messages_key,
      M.account_id,
      A.confirmed_at,
      M.message_date
      FROM ${messages.SQL_TABLE_NAME} M
      INNER JOIN (
      SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(M.messages_key ORDER BY M.messages_key ASC), ',', 10), ',', -1) as messages_key
      FROM ${messages.SQL_TABLE_NAME} M
      INNER JOIN (
        SELECT M.account_id AS account_id,
               M.messages_key AS messages_key,
               A.confirmed_at AS confirmed_at,
               M.message_date AS created_at
        FROM ${messages.SQL_TABLE_NAME} M
        INNER JOIN accounts A ON A.id = M.account_id
        GROUP BY M.account_id
        HAVING COUNT(*) >=10
      ) COM ON COM.account_id = M.account_id
      WHERE COM.created_at > COM.confirmed_at
      GROUP BY M.account_id
      ) LAST_COM ON LAST_COM.messages_key = M.messages_key
      INNER JOIN accounts A on A.id = M.account_id ;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: cohort_size_reached {
    type: count_distinct
    sql: ${account_id} ;;
  }

  measure: average_time_to_10 {
    type: average
    sql: ${days_to_ten}  ;;
    value_format: "###"
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: confirmed_at {
    type: time
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: days_to_ten {
    type: number
    sql: TIMESTAMPDIFF(DAY, ${TABLE}.confirmed_at, ${TABLE}.created_at) ;;
  }

  set: detail {
    fields: [id, account_id, confirmed_at_time, created_at_time]
  }
}
