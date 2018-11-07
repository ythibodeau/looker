view: location_geometries {
  sql_table_name: petalmd_development.location_geometries ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: location_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: pt {
    type: string
    sql: ${TABLE}.pt ;;
  }

  measure: count {
    type: count
    drill_fields: [id, locations.id]
  }
}
