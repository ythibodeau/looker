view: _slot_kinds {
  sql_table_name: petalmd_development.sche__slot_kinds ;;

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

  dimension: end_moment {
    type: number
    sql: ${TABLE}.end_moment ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: oncall_day {
    type: yesno
    sql: ${TABLE}.oncall_day ;;
  }

  dimension: oncall_evening {
    type: yesno
    sql: ${TABLE}.oncall_evening ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: raw_rules {
    type: string
    sql: ${TABLE}.raw_rules ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: start_moment {
    type: number
    sql: ${TABLE}.start_moment ;;
  }

  dimension: task_afternoon {
    type: yesno
    sql: ${TABLE}.task_afternoon ;;
  }

  dimension: task_evening {
    type: yesno
    sql: ${TABLE}.task_evening ;;
  }

  dimension: task_lunch {
    type: yesno
    sql: ${TABLE}.task_lunch ;;
  }

  dimension: task_morning {
    type: yesno
    sql: ${TABLE}.task_morning ;;
  }

  dimension: task_night {
    type: yesno
    sql: ${TABLE}.task_night ;;
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
    drill_fields: [id, name]
  }
}
