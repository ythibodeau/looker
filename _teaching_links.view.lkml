view: _teaching_links {
  sql_table_name: petalmd_development.sche__teaching_links ;;

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

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
  }

  dimension: residency_assignment_id {
    type: number
    sql: ${TABLE}.residency_assignment_id ;;
  }

  dimension: teaching_assignment_id {
    type: number
    sql: ${TABLE}.teaching_assignment_id ;;
  }

  dimension: teaching_ratio_id {
    type: number
    sql: ${TABLE}.teaching_ratio_id ;;
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
