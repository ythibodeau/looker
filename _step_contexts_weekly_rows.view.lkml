view: _step_contexts_weekly_rows {
  sql_table_name: petalmd_development.sche__step_contexts_weekly_rows ;;

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

  dimension: step_context_id {
    type: number
    sql: ${TABLE}.step_context_id ;;
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

  dimension: weekly_row_id {
    type: number
    sql: ${TABLE}.weekly_row_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
