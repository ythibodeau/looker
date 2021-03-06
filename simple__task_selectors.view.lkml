view: simple__task_selectors {
  sql_table_name: petalmd.simple__task_selectors ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: kind {
    type: number
    sql: ${TABLE}.kind ;;
  }

  dimension: schedule_configuration_id {
    type: number
    sql: ${TABLE}.schedule_configuration_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}