view: pati__appointment_check_in_patients {
  sql_table_name: petalmd.pati__appointment_check_in_patients ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: appointment_check_in_id {
    type: number
    sql: ${TABLE}.appointment_check_in_id ;;
  }

  dimension: appointment_id {
    type: number
    sql: ${TABLE}.appointment_id ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}