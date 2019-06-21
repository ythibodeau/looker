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

  dimension: name {
    type: string
    sql:
    CASE ${area_level_1}
      WHEN "BC" THEN "British Columbia"
      WHEN "British Columbia" THEN "British Columbia"
      WHEN "AB" THEN "Alberta"
      WHEN "Alberta" THEN "Alberta"
      WHEN "SK" THEN "Saskatchewan"
      WHEN "MB" THEN "Manitoba"
      WHEN "ON" THEN "Ontario"
      WHEN "QC" THEN "Québec"
      WHEN "Quebec" THEN "Québec"
      WHEN "NB" THEN "New Brunswick"
      WHEN "New Brunswick" THEN "New Brunswick"
      WHEN "NS" THEN "Nova Scotia"
      WHEN "PE" THEN "Prince Edward Island"
      WHEN "NL" THEN "Newfoundland and Labrador"
      WHEN "Newfoundland and Labrador" THEN "Newfoundland and Labrador"
      WHEN "NU" THEN "Nunavut"
      WHEN "YT" THEN "Yukon"
      WHEN "NT" THEN "Northwest Territories"
      WHEN "NWT" THEN "Northwest Territories"
    END
    ;;
    map_layer_name: canada_layer
  }

  dimension: area_level_2 {
    type: string
    sql: ${TABLE}.area_level_2 ;;
    map_layer_name: canadacensus_layer
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
