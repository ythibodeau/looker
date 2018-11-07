view: _teaching_ratios {
  sql_table_name: petalmd_development.sche__teaching_ratios ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: abbreviation {
    type: string
    sql: ${TABLE}.abbreviation ;;
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

  dimension: maximum {
    type: number
    sql: ${TABLE}.maximum ;;
  }

  dimension: minimum {
    type: number
    sql: ${TABLE}.minimum ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: residency_task_selector {
    type: string
    sql: ${TABLE}.residency_task_selector ;;
  }

  dimension: resource_selector {
    type: string
    sql: ${TABLE}.resource_selector ;;
  }

  dimension: task_selector {
    type: string
    sql: ${TABLE}.task_selector ;;
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
