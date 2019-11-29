view: health_clusters {
  sql_table_name: petalmd.health_clusters ;;

  dimension: parent_health_cluster_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.parent_health_cluster_id ;;
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

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
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
    sql:
     CASE
       WHEN ${TABLE}.id IN (72,96,108,300) THEN "COHORT A"
       WHEN ${TABLE}.id IN (93,111) THEN "COHORT C"
       ELSE "COHORT B"
     END
     ;;
  }

  measure: count {
    type: count
    drill_fields: [parent_health_cluster_id, name, health_institutions.count]
  }
}
