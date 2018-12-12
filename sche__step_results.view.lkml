view: sche__step_results {
  sql_table_name: petalmd_development.sche__step_results ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: actual {
    type: number
    sql: ${TABLE}.actual ;;
  }

  dimension: completed {
    type: yesno
    sql: ${TABLE}.completed ;;
  }

  dimension_group: completed {
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
    sql: ${TABLE}.completed_at ;;
  }

  dimension_group: configured {
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
    sql: ${TABLE}.configured_at ;;
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

  dimension: engine_log {
    type: string
    sql: ${TABLE}.engine_log ;;
  }

  dimension: engine_raw_data {
    type: string
    sql: ${TABLE}.engine_raw_data ;;
  }

  dimension: engine_status_code {
    type: number
    sql: ${TABLE}.engine_status_code ;;
  }

  dimension: engine_status_message {
    type: string
    sql: ${TABLE}.engine_status_message ;;
  }

  dimension: error_info {
    type: string
    sql: ${TABLE}.error_info ;;
  }

  dimension: execution_mode {
    type: number
    sql: ${TABLE}.execution_mode ;;
  }

  dimension: initial {
    type: number
    sql: ${TABLE}.initial ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension_group: optimized {
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
    sql: ${TABLE}.optimized_at ;;
  }

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
  }

  dimension_group: queued {
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
    sql: ${TABLE}.queued_at ;;
  }

  dimension_group: requested {
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
    sql: ${TABLE}.requested_at ;;
  }

  dimension_group: started {
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
    sql: ${TABLE}.started_at ;;
  }

  dimension: step_id {
    type: number
    sql: ${TABLE}.step_id ;;
  }

  dimension: target {
    type: number
    sql: ${TABLE}.target ;;
  }

  dimension: undoed {
    type: yesno
    sql: ${TABLE}.undoed ;;
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
