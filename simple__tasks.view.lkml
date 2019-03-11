view: simple__tasks {
  sql_table_name: petalmd.simple__tasks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: assignable {
    type: yesno
    sql: ${TABLE}.assignable ;;
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

  dimension: multi_selector_id {
    type: number
    sql: ${TABLE}.multi_selector_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: oncall {
    type: yesno
    sql: ${TABLE}.oncall ;;
  }

  dimension: planner_splittable {
    type: yesno
    sql: ${TABLE}.planner_splittable ;;
  }

  dimension: schedule_configuration_id {
    type: number
    sql: ${TABLE}.schedule_configuration_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: splittable {
    type: yesno
    sql: ${TABLE}.splittable ;;
  }

  dimension: time_selector_id {
    type: number
    sql: ${TABLE}.time_selector_id ;;
  }

  dimension: transferable {
    type: yesno
    sql: ${TABLE}.transferable ;;
  }

  dimension: unassignable {
    type: yesno
    sql: ${TABLE}.unassignable ;;
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
    drill_fields: [id, name]
  }
}