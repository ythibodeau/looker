view: simple__resource_selector_resources {
  sql_table_name: petalmd.simple__resource_selector_resources ;;

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

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
  }

  dimension: resource_selector_id {
    type: number
    sql: ${TABLE}.resource_selector_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}