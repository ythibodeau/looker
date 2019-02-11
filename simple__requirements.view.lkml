view: simple__requirements {
  sql_table_name: petalmd.simple__requirements ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: end_moment {
    type: number
    sql: ${TABLE}.end_moment ;;
  }

  dimension: index {
    type: number
    sql: ${TABLE}.`index` ;;
  }

  dimension: maximum {
    type: number
    sql: ${TABLE}.maximum ;;
  }

  dimension: minimum {
    type: number
    sql: ${TABLE}.minimum ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: schedule_configuration_id {
    type: number
    sql: ${TABLE}.schedule_configuration_id ;;
  }

  dimension: start_moment {
    type: number
    sql: ${TABLE}.start_moment ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: time_selector_id {
    type: number
    sql: ${TABLE}.time_selector_id ;;
  }

  dimension: units {
    type: number
    sql: ${TABLE}.units ;;
  }

  dimension: units_per {
    type: number
    sql: ${TABLE}.units_per ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}