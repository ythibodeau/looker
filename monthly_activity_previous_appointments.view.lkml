view: monthly_activity_previous_appointments {
  derived_table: {
    sql: SELECT
          CONCAT(date_format(MAC.appointment_month, '%Y-%m'), "-", CAST(MAC.patient_id as CHAR)) as mapc_key
        , date_format(MAC.appointment_month, '%Y-%m') as appointment_month
        , MAC.patient_id as patient_id
        , MAC.monthly_appointments
        , date_format(max(months_with_appointments.month_with_appointment), '%Y-%m') as previous_appointment_month
      FROM
        ${monthly_activity_appointments.SQL_TABLE_NAME} MAC
        LEFT JOIN (
          SELECT
              a1.appointment_month as month_with_appointment
            , a1.patient_id as patient_id
          FROM
             ${monthly_activity_appointments.SQL_TABLE_NAME} a1
          WHERE
            a1.monthly_appointments > 0
          ) months_with_appointments
          on MAC.patient_id = months_with_appointments.patient_id
          and extract(year_month from MAC.appointment_month) > extract(year_month from months_with_appointments.month_with_appointment)
          WHERE MAC.appointment_month IS NOT NULL
      GROUP BY
        appointment_month, patient_id, monthly_appointments
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: mapc_key {
    type: string
    sql: ${TABLE}.mapc_key ;;
  }

  dimension: appointment_month {
    type: string
    sql: ${TABLE}.appointment_month ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: monthly_appointments {
    type: number
    sql: ${TABLE}.monthly_appointments ;;
  }

  dimension: previous_appointment_month {
    type: string
    sql: ${TABLE}.previous_appointment_month ;;
  }

  set: detail {
    fields: [mapc_key, appointment_month, patient_id, monthly_appointments, previous_appointment_month]
  }
}
