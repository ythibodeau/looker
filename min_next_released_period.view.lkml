view: min_next_released_period {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select
      all_released_periods.group_id AS group_id,
      MIN(all_released_periods.period_id) as period_id,
      all_released_periods.start_date as period_start_date
      from ${all_released_periods.SQL_TABLE_NAME} AS all_released_periods
      group by 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension_group: period_start_date {
    type: time
    sql: ${TABLE}.period_start_date ;;
  }

  set: detail {
    fields: [group_id, period_id, period_start_date_time]
  }
}
