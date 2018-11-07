view: _equity_packs_sche__weekly_rows {
  sql_table_name: petalmd_development.sche__equity_packs_sche__weekly_rows ;;

  dimension: equity_pack_id {
    type: number
    sql: ${TABLE}.equity_pack_id ;;
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
