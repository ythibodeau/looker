view: pati__task_task_fallbacks {
  sql_table_name: petalmd_development.pati__task_task_fallbacks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }

  dimension: task_fallback_id {
    type: number
    sql: ${TABLE}.task_fallback_id ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
