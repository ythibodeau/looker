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

  dimension: cancelled_by_type_clean {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.cancelled_by_type = "Account" THEN "Staff"
      WHEN ${TABLE}.cancelled_by_type = "Patient::Patient" THEN "Patient"
    END;;
  }

  dimension: cancelled_on_behalf_of_patient {
    type: yesno
    sql: ${TABLE}.cancelled_on_behalf_of_patient ;;
  }

  dimension_group: created {
    type: time
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

  dimension: created_by_type_clean {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.created_by_type = "Account" THEN "Staff"
      WHEN ${TABLE}.created_by_type = "Patient::Patient" THEN "Patient"
    END;;
  }

  dimension: hub_source {
    type: string
    sql:
         CASE
        WHEN ${TABLE}.created_by_type = "BookingHub::Partner::Partner" THEN "RVSQ 2.0"
        ELSE "Clinique"
      END
    ;;
  }

  dimension: delay_in_minutes {
    type: number
    sql: TIMESTAMPDIFF(MINUTE,${created_time},${pati__availabilities.start_time}) ;;
  }

  dimension: delay_in_hours {
    type: number
    sql: TIMESTAMPDIFF(HOUR,${created_time},${pati__availabilities.start_time}) ;;
  }

  measure: count_36h {
    type: count_distinct
    sql: ${id} ;;
    filters: [delay_in_hours: "<= 36", created_by_type: "BookingHub::Partner::Partner"]
    drill_fields: [details_hub*]
  }

  dimension: delay_in_days {
    type: number
    sql: TIMESTAMPDIFF(DAY,${created_time},${pati__availabilities.start_time}) ;;
  }


  measure: average_delay  {
    label: "average_delay_minutes_appointment"
    type: average_distinct
    sql:  ${delay_in_minutes};;
  }

  measure: average_delay_day  {
    label: "average_delay_day_appointment"
    type: average_distinct
    sql:  ${delay_in_days};;
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

  dimension: created_month_only {
    type: number
    sql: MONTH(${pati__appointments.created_date});;
  }

  measure: count {
    type: count
    sql: ISNULL(id, 0 ) ;;
    drill_fields: [details_hub*]
  }

  measure: unique_patients_count {
    type: count_distinct
    sql: ${pati__appointments.patient_id} ;;
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

  ## À Modifier pour "pris dans le EMR"
  measure: staff_count {
    label: "All Appointments Staff Count"
    type: count
    filters: {
      field: cancelled
      value: "0"
    }
    filters: {
      field: created_by_type
      value: "Account"
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

    drill_fields: [details_manitoba*]
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

  measure: hub_by_rvsq20_count {
    type: count
    filters: [hub_source: "RVSQ 2.0"]
  }

  measure: hub_by_clinics_count {
    type: count
    filters: [hub_source: "Clinique"]
  }

  set: details {
    fields: [id,created_date,pati__reasons.description_en,groups.name]
  }

  set: details_hub {
    fields: [
      id,
      created_time,
      group_clinics.acronym,
      group_clinics.name,
      groups.acronym,
      pati__providers.adapterable_type,
      pati__offerings.emr_service_code,
      pati__offerings.emr_service_name,
      pati__offerings.description_fr_ca,
      pati__offerings.clean_category,
      pati__offerings.offer_kind,
      pati__availabilities.start_time,
      cancelled,
      pati__availabilities.id,
      delay_in_hours
      ]
  }

  set: details_manitoba {
    fields: [
      id,
      created_time,
      group_clinics.acronym,
      group_clinics.name,
      groups.acronym,
      pati__patients.first_name,
      pati__patients.last_name,
      accounts.full_name,
      pati_reasons.description_en,
      pati__availabilities.start_time,
      cancelled,
      pati__availabilities.id,
      delay_in_hours
    ]
  }
}
