view: monthly_activity_appointments {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
          pati__patients.id as patient_id
        , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', pati__patients.accepted_at) MONTH) as signup_month
        , month_list.appointment_month as appointment_month
        , COALESCE(data_x.monthly_appointments, 0) as monthly_appointments
        ,(@row_number:=@row_number + 1) AS num
      FROM
       (SELECT @row_number:=0) AS t, pati__patients
      LEFT JOIN
        (
          SELECT
           DISTINCT(date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', a.created_at) MONTH)) as appointment_month
          FROM pati__appointments a
        ) as month_list
      ON month_list.appointment_month >= date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', pati__patients.accepted_at) MONTH)
      LEFT JOIN
        (
          SELECT
                a.patient_id
              , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', a.created_at) MONTH) as appointment_month
              , COUNT(distinct a.id) AS monthly_appointments
          FROM pati__appointments a
          WHERE a.created_by_type = "Patient::Patient"
          AND a.cancelled = 0
          GROUP BY 1,2
        ) as data_x
      ON data_x.appointment_month = month_list.appointment_month
      AND data_x.patient_id = pati__patients.id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

#   dimension: signup_month {
#     type: string
#     sql: ${TABLE}.signup_month ;;
#   }

  dimension_group: signup {
    type: time
    timeframes: [date, month]
    sql: ${TABLE}.signup_month ;;
  }

  dimension: appointment_month {
    type: string
    sql: ${TABLE}.appointment_month ;;
  }

  dimension: monthly_appointments {
    type: number
    sql: ${TABLE}.monthly_appointments ;;
  }

  dimension: months_since_signup {
    type: number
    sql: TIMESTAMPDIFF(MONTH, ${TABLE}.signup_month, ${TABLE}.appointment_month) ;;
  }

  dimension: num {
    type: number
    sql: ${TABLE}.num ;;
  }

  measure: total_users {
    type: count_distinct
    sql: ${patient_id} ;;
    drill_fields: [accounts.id, accounts.first_name, accounts.last_name]
  }

  measure: total_active_users {
    type: count_distinct
    sql: ${patient_id} ;;

    filters: {
      field: monthly_appointments
      value: ">0"
    }
  }

  measure: percent_of_cohort_active {
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${total_active_users} / nullif(${total_users},0) ;;
    drill_fields: [patient_id, accounts.first_name, accounts.last_name, account.simplified_kind, accounts.group_acronyms, monthly_appointments]
  }

  set: detail {
    fields: [patient_id, signup_month, appointment_month, monthly_appointments, num]
  }
}
