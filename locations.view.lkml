view: locations {
  sql_table_name: petalmd.locations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: area_level_1 {
    type: string
    sql: ${TABLE}.area_level_1 ;;
  }

  dimension: area_level_2 {
    type: string
    sql: ${TABLE}.area_level_2 ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

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

  dimension: locality {
    type: string
    sql: ${TABLE}.locality ;;
  }

  dimension: raw_data {
    type: string
    sql: ${TABLE}.raw_data ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
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

  measure: count {
    type: count
    drill_fields: [id, groups.count, location_geometries.count]
  }
}