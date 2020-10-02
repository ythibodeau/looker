view: pati__availabilities {
  sql_table_name: petalmd.pati__availabilities ;;

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

  dimension: clean_state {
    type: string
    sql:
      CASE
        WHEN  ${TABLE}.state = 0 THEN "Web"
        WHEN  ${TABLE}.state = 1 THEN "Opened"
        WHEN  ${TABLE}.state = 1 THEN "Closed"
      END

    ;;

  }

  dimension: synched {
    type: yesno
    sql: ${TABLE}.synched ;;
  }

  dimension: is_am {
    type: yesno
    sql: HOUR(CONVERT_TZ(${TABLE}.start_time ,'UTC','America/New_York')) > 6 AND HOUR(CONVERT_TZ(${TABLE}.start_time ,'UTC','America/New_York')) < 12 ;;
  }

  dimension: is_pm {
    type: yesno
    sql: HOUR(CONVERT_TZ(${TABLE}.start_time ,'UTC','America/New_York')) > 11 AND HOUR(CONVERT_TZ(${TABLE}.start_time ,'UTC','America/New_York')) < 17 ;;
  }

  dimension: is_night {
    type: yesno
    sql: HOUR(CONVERT_TZ(${TABLE}.start_time ,'UTC','America/New_York')) > 16 AND HOUR(CONVERT_TZ(${TABLE}.start_time ,'UTC','America/New_York')) < 23 ;;
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

  measure: count_web {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: state
      value: "0"
    }
    filters: [
      visibility: "0"
    ]
    drill_fields: [detail*]
  }

  measure: count_opened {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: state
      value: "1"
    }
    filters: [
      visibility: "0"
    ]
    drill_fields: [detail*]
  }

  measure: count_web_am {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: state
      value: "1"
    }
    filters: [
      visibility: "0"
    ]
    filters: [
      is_am: "Yes"
    ]
  }

  measure: count_web_pm {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: state
      value: "1"
    }
    filters: [
      visibility: "0"
    ]
    filters: [
      is_pm: "Yes"
    ]
  }

  measure: count_web_night {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: state
      value: "1"
    }
    filters: [
      visibility: "0"
    ]
    filters: [
      is_night: "Yes"
    ]
  }

  set: detail {
    fields: [
      id,
      pati__providers.adapterable_type,
      groups.name,
      accounts.full_name,
      pati__offerings.description_fr_ca,
      pati__reasons.description_fr_ca,
      start_time,
      end_time
    ]
  }

}
