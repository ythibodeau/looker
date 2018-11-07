view: _step_contexts {
  sql_table_name: petalmd_development.sche__step_contexts ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: availability_weekly_row_id {
    type: number
    sql: ${TABLE}.availability_weekly_row_id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: mode {
    type: number
    sql: ${TABLE}.mode ;;
  }

  dimension: step_id {
    type: number
    sql: ${TABLE}.step_id ;;
  }

  dimension: task_kind_subset_id {
    type: number
    sql: ${TABLE}.task_kind_subset_id ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
