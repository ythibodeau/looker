view: simple__equity_pack_targets {
  sql_table_name: petalmd_development.simple__equity_pack_targets ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: equity_pack_id {
    type: number
    sql: ${TABLE}.equity_pack_id ;;
  }

  dimension: time_selector_id {
    type: number
    sql: ${TABLE}.time_selector_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
