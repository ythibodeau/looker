view: scheduling_first_action {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
       MA.account_id,
       MA.signup AS signup,
       MIN(MA.action_date) AS first_action,
       MAX(MA.action_date) AS last_action,
       TIMESTAMPDIFF(DAY, MA.signup, MIN(MA.action_date)) as first_usage_delay
    FROM ${scheduling_actions.SQL_TABLE_NAME} MA
    GROUP BY account_id
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
    sql: ${TABLE}.signup ;;
  }

  dimension: first_action {
    type: string
    sql: ${TABLE}.first_action ;;
  }

  dimension: last_action {
    type: string
    sql: ${TABLE}.last_action ;;
  }

  dimension: first_usage_delay {
    type: number
    sql: ${TABLE}.first_usage_delay ;;
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

  set: detail {
    fields: [account_id, signup_time, first_action, last_action, first_usage_delay]
  }
}
