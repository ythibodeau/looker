view: account_first_message_read {
  derived_table: {
    sql: SELECT
       MA.account_id,
       MA.signup AS signup,
       MIN(MA.action_date) AS first_comment_read,
       MAX(MA.action_date) AS last_comment_read,
       TIMESTAMPDIFF(DAY, MA.signup, MIN(MA.action_date)) as first_usage_delay
    FROM ${messaging_actions.SQL_TABLE_NAME} MA
    WHERE MA.action in ("read_comm", "read_chat")
    GROUP BY account_id;
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

  dimension_group: signup {
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
    sql: ${TABLE}.signup ;;
  }

  dimension_group: first_comment_read {
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
    sql: ${TABLE}.first_comment_read ;;
  }

  dimension_group: last_comment_read {
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
    sql: ${TABLE}.last_comment_read ;;
  }

  dimension: first_usage_delay {
    type: number
    sql: ${TABLE}.first_usage_delay ;;
  }

  measure: avg_first_usage_delay {
    type: average
    sql: ${first_usage_delay} ;;
  }

  set: detail {
    fields: [account_id, signup_time, first_comment_read_time, last_comment_read_time, first_usage_delay]
  }
}
