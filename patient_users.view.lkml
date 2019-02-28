view: patient_users {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select id from pati__patients where state = 3
      union
      select distinct target_id from noti__notifications;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  set: detail {
    fields: [id]
  }
}
