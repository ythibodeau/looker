view: health_institutions {
  sql_table_name: petalmd.health_institutions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
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

  dimension: health_cluster_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.health_cluster_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: region_id {
    type: number
    sql: ${TABLE}.region_id  ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.short_name ;;
  }

  dimension: parent_health_institution_id {
    type: number
    sql: ${TABLE}.parent_health_institution_id ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: territory_id {
    type: number
    sql: ${TABLE}.territory_id ;;
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

  dimension: cohort {
    type: string
    sql: ${health_clusters.cohort} ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, health_clusters.name, health_clusters.parent_health_cluster_id]
  }
}
