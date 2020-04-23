view: account_first_message {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
       M.account_id,
       A.confirmed_at AS confirmed_at,
       MIN(M.message_date) AS first_comment,
       MAX(M.message_date) AS last_comment,
       TIMESTAMPDIFF(DAY, A.confirmed_at, MIN(M.message_date)) as first_usage_delay,
       M.message_type as message_type
    FROM ${messages.SQL_TABLE_NAME} M
    INNER JOIN accounts A ON A.id = M.account_id
    GROUP BY account_id;
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_distinct_account_id {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
    drill_fields: [detail*]
  }

  measure: avg_first_usage_delay {
    type: average
    sql: ${first_usage_delay} ;;
  }

  dimension: account_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: confirmed_at {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension_group: first_comment {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.first_comment ;;
  }

  dimension_group: last_comment {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.last_comment ;;
  }

  dimension: first_usage_delay {
    type: number
    sql: ${TABLE}.first_usage_delay ;;
  }

  dimension: message_type {
    type: string
    sql: ${TABLE}.message_type ;;
  }

  set: detail {
    fields: [account_id, confirmed_at_time, first_comment_time, first_usage_delay, message_type]
  }
}
