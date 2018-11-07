view: _days_sche__spans {
  sql_table_name: petalmd_development.sche__days_sche__spans ;;

  dimension: day_id {
    type: number
    sql: ${TABLE}.day_id ;;
  }

  dimension: span_id {
    type: number
    sql: ${TABLE}.span_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
