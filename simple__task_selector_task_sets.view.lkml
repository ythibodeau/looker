view: simple__task_selector_task_sets {
  sql_table_name: petalmd_development.simple__task_selector_task_sets ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: index {
    type: number
    sql: ${TABLE}.`index` ;;
  }

  dimension: kind {
    type: number
    sql: ${TABLE}.kind ;;
  }

  dimension: task_selector_id {
    type: number
    sql: ${TABLE}.task_selector_id ;;
  }

  dimension: task_set_id {
    type: number
    sql: ${TABLE}.task_set_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
