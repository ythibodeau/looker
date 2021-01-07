view: appointment_last_status {
  derived_table: {
    sql: SELECT a.id as appointment_id,
        MAX(pas.id) as status_id,
        pas.patient_status_id as patient_status_id
      FROM pati__appointments a
      LEFT JOIN pati__appointment_patient_statuses pas
      ON a.id = pas.appointment_id
      GROUP BY a.id
            ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: appointment_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.appointment_id ;;
  }

  dimension: status_id {
    type: number
    sql: ${TABLE}.status_id ;;
  }

  dimension: patient_status_id {
    type: number
    sql: ${TABLE}.patient_status_id ;;
  }

  set: detail {
    fields: [appointment_id, status_id]
  }
}
