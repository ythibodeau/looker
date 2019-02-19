view: simple__equity_packs {
  sql_table_name: petalmd.simple__equity_packs ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: multi_selector_id {
    type: number
    sql: ${TABLE}.multi_selector_id ;;
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

  dimension: time_selector_id {
    type: number
    sql: ${TABLE}.time_selector_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}