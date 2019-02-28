view: simple__multi_selector_items {
  sql_table_name: petalmd.simple__multi_selector_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: multi_selector_id {
    type: number
    sql: ${TABLE}.multi_selector_id ;;
  }

  dimension: resource_selector_id {
    type: number
    sql: ${TABLE}.resource_selector_id ;;
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
    drill_fields: [id]
  }
}