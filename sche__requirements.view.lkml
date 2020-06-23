view: sche__requirements {
  sql_table_name: petalmd.sche__requirements ;;

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

  dimension: maximum {
    type: number
    sql: ${TABLE}.maximum ;;
  }

  dimension: minimum {
    type: number
    sql: ${TABLE}.minimum ;;
  }

  dimension: skill_id {
    type: number
    sql: ${TABLE}.skill_id ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: coverage_break {
    type: string
    sql: "Coverage Break" ;;
  }

#   dimension: is_coverage_break {
#     type: yesno
#     sql: sche__task_kinds.restriction_kind_id = 2 AND sche__assignments.requirement_id IS NULL
#          AND ${minimum} >= 1;;
#   }

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
