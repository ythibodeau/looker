view: pati__recall_list_reasons {
  sql_table_name: petalmd.pati__recall_list_reasons ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: reason_id {
    type: number
    sql: ${TABLE}.reason_id ;;
  }

  dimension: recall_list_id {
    type: number
    sql: ${TABLE}.recall_list_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}