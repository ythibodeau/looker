view: _constraints {
  sql_table_name: petalmd_development.sche__constraints ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: configuration {
    type: string
    sql: ${TABLE}.configuration ;;
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

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: explicit_message {
    type: string
    sql: ${TABLE}.explicit_message ;;
  }

  dimension: generated {
    type: yesno
    sql: ${TABLE}.generated ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: positive {
    type: yesno
    sql: ${TABLE}.positive ;;
  }

  dimension: positive_type {
    type: number
    sql: ${TABLE}.positive_type ;;
  }

  dimension: reason_long {
    type: string
    sql: ${TABLE}.reason_long ;;
  }

  dimension: reason_sequence {
    type: number
    sql: ${TABLE}.reason_sequence ;;
  }

  dimension: reason_short {
    type: string
    sql: ${TABLE}.reason_short ;;
  }

  dimension: resource_selector {
    type: string
    sql: ${TABLE}.resource_selector ;;
  }

  dimension: second_resource_selector {
    type: string
    sql: ${TABLE}.second_resource_selector ;;
  }

  dimension: strong {
    type: yesno
    sql: ${TABLE}.strong ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
