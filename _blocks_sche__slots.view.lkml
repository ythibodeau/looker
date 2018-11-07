view: _blocks_sche__slots {
  sql_table_name: petalmd_development.sche__blocks_sche__slots ;;

  dimension: block_id {
    type: number
    sql: ${TABLE}.block_id ;;
  }

  dimension: slot_id {
    type: number
    sql: ${TABLE}.slot_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
