view: all_released_periods {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
        sche__periods.group_id  AS `group_id`,
        sche__periods.id  AS `period_id`,
        sche__periods.start_date as `start_date`
      FROM petalmd.sche__periods  AS sche__periods

      WHERE
        (sche__periods.state = 'released')
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

  dimension_group: start_date {
    type: time
    sql: ${TABLE}.start_date ;;
  }

  set: detail {
    fields: [group_id, period_id, start_date_time]
  }
}
