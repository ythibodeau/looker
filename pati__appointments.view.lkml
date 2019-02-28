view: pati__appointments {
  sql_table_name: petalmd.pati__appointments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: availability_id {
    type: number
    sql: ${TABLE}.availability_id ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled_at ;;
  }

  dimension: cancelled_by_id {
    type: number
    sql: ${TABLE}.cancelled_by_id ;;
  }

  dimension: cancelled_by_type {
    type: string
    sql: ${TABLE}.cancelled_by_type ;;
  }

  dimension: cancelled_on_behalf_of_patient {
    type: yesno
    sql: ${TABLE}.cancelled_on_behalf_of_patient ;;
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

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: created_by_type {
    type: string
    sql: ${TABLE}.created_by_type ;;
  }

  dimension: created_in_emr {
    type: yesno
    sql: ${TABLE}.created_in_emr ;;
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

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: session_uuid {
    type: string
    sql: ${TABLE}.session_uuid ;;
  }

  dimension: source {
    type: number
    sql: ${TABLE}.source ;;
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

  dimension: visit_reason {
    type: string
    sql: ${TABLE}.visit_reason ;;
  }

  dimension: is_walkin {
    type: yesno
    sql: ${pati__offerings.code} IN ("WALK-IN", "WALK_IN") ;;
  }

  measure: count {
    type: count
    drill_fields: [details*]
  }


  measure: patient_count {
    label: "All Appointments Patients Count"
    type: count
    filters: {
      field: cancelled
      value: "0"
    }
    filters: {
      field: created_by_type
      value: "Patient::Patient"
    }
  }

  measure: patient_web_count {
    label: "Patient Appointments by Web"
    type: count
    filters: {
      field: cancelled
      value: "0"
    }
    filters: {
      field: created_by_type
      value: "Patient::Patient"
    }
    filters: {
      field: source
      value: "0"
    }
  }

  measure: patient_phone_count {
    label: "Patient Appointments by Phone"
    type: count
    filters: {
      field: cancelled
      value: "0"
    }
    filters: {
      field: created_by_type
      value: "Patient::Patient"
    }
    filters: {
      field: source
      value: "1"
    }
  }

  measure: patient_regular_count {
    label: "All Regular Appointments Patients Count"
    type: count
    filters: {
      field: cancelled
      value: "0"
    }
    filters: {
      field: created_by_type
      value: "Patient::Patient"
    }
    filters: {
      field: is_walkin
      value: "No"
    }
  }

  measure: patient_walk_in_count {
    label: "All Walk-in Appointments Patients Count"
    type: count
    filters: {
      field: cancelled
      value: "0"
    }
    filters: {
      field: created_by_type
      value: "Patient::Patient"
    }
    filters: {
      field: is_walkin
      value: "Yes"
    }
  }

  set: details {
    fields: [id,created_date,pati__reasons.description_en,groups.name]
  }
}
