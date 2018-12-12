view: pati__availabilities {
  sql_table_name: petalmd_development.pati__availabilities ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_task_id {
    type: number
    sql: ${TABLE}.account_task_id ;;
  }

  dimension: assignment_id {
    type: number
    sql: ${TABLE}.assignment_id ;;
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

  dimension: created_by_emr {
    type: yesno
    sql: ${TABLE}.created_by_emr ;;
  }

  dimension_group: disabled {
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
    sql: ${TABLE}.disabled_at ;;
  }

  dimension: disabled_by_id {
    type: number
    sql: ${TABLE}.disabled_by_id ;;
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

  dimension: error_code {
    type: number
    sql: ${TABLE}.error_code ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension_group: note_edited {
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
    sql: ${TABLE}.note_edited_at ;;
  }

  dimension: note_edited_by_id {
    type: number
    sql: ${TABLE}.note_edited_by_id ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension_group: reserved {
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
    sql: ${TABLE}.reserved_at ;;
  }

  dimension: reserved_by_id {
    type: number
    sql: ${TABLE}.reserved_by_id ;;
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

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
  }

  dimension: synched {
    type: yesno
    sql: ${TABLE}.synched ;;
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

  dimension: visibility {
    type: number
    sql: ${TABLE}.visibility ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: count_patient_visible_availabilities {
    label: "Patient Visible Count"
    type: count
    filters: {
      field: visibility
      value: "0"
    }
    filters: {
      field: state
      value: "0"
    }
  }

  measure: count_all_availabilities {
    label: "Total Visible Count"
    type: count
    filters: {
      field: visibility
      value: "0"
    }
  }

}
