view: simple__task_selector_tasks {
  sql_table_name: petalmd.simple__task_selector_tasks ;;

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

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: task_selector_id {
    type: number
    sql: ${TABLE}.task_selector_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}