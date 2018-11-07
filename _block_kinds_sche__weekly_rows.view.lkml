view: _block_kinds_sche__weekly_rows {
  sql_table_name: petalmd_development.sche__block_kinds_sche__weekly_rows ;;

  dimension: block_kind_id {
    type: number
    sql: ${TABLE}.block_kind_id ;;
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
