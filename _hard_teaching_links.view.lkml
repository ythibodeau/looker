view: _hard_teaching_links {
  sql_table_name: petalmd_development.sche__hard_teaching_links ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: residency_resource_id {
    type: number
    sql: ${TABLE}.residency_resource_id ;;
  }

  dimension: teaching_ratio_id {
    type: number
    sql: ${TABLE}.teaching_ratio_id ;;
  }

  dimension: teaching_resource_id {
    type: number
    sql: ${TABLE}.teaching_resource_id ;;
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
    drill_fields: [id]
  }
}
