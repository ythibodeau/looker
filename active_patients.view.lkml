view: active_patients {
  derived_table: {
    sql_trigger_value: SELECT CURDATE();;
    indexes: ["xdate"]
    sql: SELECT daily_use.patient_id,
       wd.date as xdate,
       MIN(DATEDIFF(wd.date, daily_use.appointment_date)) as days_since_last_action
FROM ${date_series_table.SQL_TABLE_NAME} as wd
LEFT JOIN (
SELECT DISTINCT a.patient_id, DATE_FORMAT(a.created_at, '%Y-%m-%d') as appointment_date
FROM pati__appointments a
WHERE YEAR(a.created_at) >= 2019) as daily_use
ON wd.date BETWEEN daily_use.appointment_date AND DATE_ADD(daily_use.appointment_date, INTERVAL 30 DAY)
GROUP BY 1,2
       ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.xdate ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: days_since_last_appointment {
    type: number
    sql: ${TABLE}.days_since_last_appointment ;;
    value_format_name: decimal_0
  }

  dimension: active_this_day {
    type: yesno
    sql: ${days_since_last_appointment} <  1 ;;
  }

  dimension: active_last_7_days {
    type: yesno
    sql: ${days_since_last_appointment} < 7 ;;
  }

  measure: patient_count_active_30_days {
    label: "Monthly Active Users"
    type: count_distinct
    sql: ${patient_id} ;;
    drill_fields: [patient.id, patient.name]
  }

  measure: patient_count_active_this_day {
    label: "Daily Active Users"
    type: count_distinct
    sql: ${patient_id} ;;
    drill_fields: [patient.id, patient.name]

    filters: {
      field: active_this_day
      value: "yes"
    }
  }

  measure: patient {
    label: "Weekly Active Users"
    type: count_distinct
    sql: ${patient_id} ;;
    drill_fields: [patient.id, patient.name]

    filters: {
      field: active_last_7_days
      value: "yes"
    }
  }
}
