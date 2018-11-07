view: _resources_sche__teams {
  sql_table_name: petalmd_development.sche__resources_sche__teams ;;

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
