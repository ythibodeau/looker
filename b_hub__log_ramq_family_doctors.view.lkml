view: b_hub__log_ramq_family_doctors {
  sql_table_name: petalmd.b_hub__log_ramq_family_doctors ;;
  drill_fields: [id]

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

  dimension_group: end {
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
    sql: ${TABLE}.end_time ;;
  }

  dimension: establishment_name {
    type: string
    sql: ${TABLE}.establishment_name ;;
  }

  dimension: establishment_number {
    type: number
    sql: ${TABLE}.establishment_number ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: hin {
    type: string
    sql: ${TABLE}.hin ;;
  }

  dimension: last_error_app_code {
    type: string
    sql: ${TABLE}.last_error_app_code ;;
  }

  dimension: last_error_fr_message {
    type: string
    sql: ${TABLE}.last_error_fr_message ;;
  }

  dimension: last_error_sequence_number {
    type: number
    sql: ${TABLE}.last_error_sequence_number ;;
  }

  dimension: last_error_severity_code {
    type: string
    sql: ${TABLE}.last_error_severity_code ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: locality_name {
    type: string
    sql: ${TABLE}.locality_name ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: professional_class {
    type: number
    sql: ${TABLE}.professional_class ;;
  }

  dimension: professional_number {
    type: number
    sql: ${TABLE}.professional_number ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_time ;;
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
    drill_fields: [id, locality_name, establishment_name, last_name, first_name]
  }
}
