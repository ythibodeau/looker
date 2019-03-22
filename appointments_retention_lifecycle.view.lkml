view: appointments_retention_lifecycle {
  derived_table: {
    #sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT pdt5.yearmonth as yearmonth
          , pdt5.patient_id
          , pdt4.monthly_appointments
          , pdt4.previous_appointment_month
        FROM ${year_month_patients.SQL_TABLE_NAME} as pdt5
        LEFT OUTER JOIN ${monthly_activity_previous_appointments.SQL_TABLE_NAME} as pdt4
            on pdt5.mapc_key = pdt4.mapc_key
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: lifecycle_key {
    primary_key: yes
    type: string
    sql: CONCAT( CAST(${patient_id} as CHAR), ${yearmonth}) ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  dimension: the_date {
    type: date
    sql: STR_TO_DATE(${yearmonth}, "%Y-%m") ;;
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

  dimension: is_current {
    type: yesno
    sql: ${monthly_appointments} > 0 and timestampdiff(MONTH, cast(concat(${previous_appointment_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) = 1 ;;
  }

  measure: current_count {
    type: count
    filters: {
      field: is_current
      value: "Yes"
    }
  }

#   dimension: is_sleeping {
#     type: yesno
#     sql: ${monthly_comments} = 0 and timestampdiff(MONTH, cast(concat(${previous_comment_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) >= 1 ;;
#   }

  dimension: is_sleeping {
    type: yesno
    sql: ${monthly_appointments} = 0 and timestampdiff(MONTH, cast(concat(${previous_appointment_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) = 1 ;;
  }

  measure: sleeping_count {
    type: count
    filters: {
      field: is_sleeping
      value: "Yes"
    }
  }

  dimension: is_resuscitated {
    type: yesno
    sql: ${monthly_appointments} > 0 and timestampdiff(MONTH, cast(concat(${previous_appointment_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) > 1 ;;
  }

  measure: resuscitated_count {
    type: count
    filters: {
      field: is_resuscitated
      value: "Yes"
    }
  }

  dimension: is_new {
    type: yesno
    sql: ${monthly_appointments} > 0 AND ${previous_appointment_month} IS NULL ;;
  }

  measure: new_count {
    type: count
    filters: {
      field: is_new
      value: "Yes"
    }
  }

  set: detail {
    fields: [yearmonth, patient_id, monthly_appointments, previous_appointment_month]
  }
}
