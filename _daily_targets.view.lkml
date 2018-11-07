view: _daily_targets {
  sql_table_name: petalmd_development.sche__daily_targets ;;

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

  dimension: max_1 {
    type: number
    sql: ${TABLE}.max_1 ;;
  }

  dimension: max_2 {
    type: number
    sql: ${TABLE}.max_2 ;;
  }

  dimension: max_3 {
    type: number
    sql: ${TABLE}.max_3 ;;
  }

  dimension: max_4 {
    type: number
    sql: ${TABLE}.max_4 ;;
  }

  dimension: max_5 {
    type: number
    sql: ${TABLE}.max_5 ;;
  }

  dimension: max_6 {
    type: number
    sql: ${TABLE}.max_6 ;;
  }

  dimension: max_7 {
    type: number
    sql: ${TABLE}.max_7 ;;
  }

  dimension: min_1 {
    type: number
    sql: ${TABLE}.min_1 ;;
  }

  dimension: min_2 {
    type: number
    sql: ${TABLE}.min_2 ;;
  }

  dimension: min_3 {
    type: number
    sql: ${TABLE}.min_3 ;;
  }

  dimension: min_4 {
    type: number
    sql: ${TABLE}.min_4 ;;
  }

  dimension: min_5 {
    type: number
    sql: ${TABLE}.min_5 ;;
  }

  dimension: min_6 {
    type: number
    sql: ${TABLE}.min_6 ;;
  }

  dimension: min_7 {
    type: number
    sql: ${TABLE}.min_7 ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
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

  dimension: use_requirement_values {
    type: yesno
    sql: ${TABLE}.use_requirement_values ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
