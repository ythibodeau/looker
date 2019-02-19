view: simple__weekly_rows {
  sql_table_name: petalmd.simple__weekly_rows ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: schedule_configuration_id {
    type: number
    sql: ${TABLE}.schedule_configuration_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: task_selector_id {
    type: number
    sql: ${TABLE}.task_selector_id ;;
  }

  dimension: time_selector_id {
    type: number
    sql: ${TABLE}.time_selector_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}