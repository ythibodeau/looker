view: _layout_helper_rows {
  sql_table_name: petalmd_development.sche__layout_helper_rows ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: helper_row_id {
    type: number
    sql: ${TABLE}.helper_row_id ;;
  }

  dimension: layout_id {
    type: number
    sql: ${TABLE}.layout_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
