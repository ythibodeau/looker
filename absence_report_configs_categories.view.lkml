view: absence_report_configs_categories {
  sql_table_name: petalmd_development.absence_report_configs_categories ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: config_id {
    type: number
    sql: ${TABLE}.config_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
