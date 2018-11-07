view: _task_kinds_sche__weekly_rows {
  sql_table_name: petalmd_development.sche__task_kinds_sche__weekly_rows ;;

  dimension: task_kind_id {
    type: number
    sql: ${TABLE}.task_kind_id ;;
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
