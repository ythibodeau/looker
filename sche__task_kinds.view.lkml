view: sche__task_kinds {
  sql_table_name: petalmd.sche__task_kinds ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: abbreviation {
    type: string
    sql: ${TABLE}.abbreviation ;;
  }

  dimension: acceptance_required {
    type: yesno
    sql: ${TABLE}.acceptance_required ;;
  }

  dimension: allow_custom_moments {
    type: yesno
    sql: ${TABLE}.allow_custom_moments ;;
  }

  dimension: always_print_moments {
    type: yesno
    sql: ${TABLE}.always_print_moments ;;
  }

  dimension: approval_required {
    type: yesno
    sql: ${TABLE}.approval_required ;;
  }

  dimension: assignable {
    type: yesno
    sql: ${TABLE}.assignable ;;
  }

  dimension: background_color {
    type: string
    sql: ${TABLE}.background_color ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
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

  dimension: display_oncall_number {
    type: yesno
    sql: ${TABLE}.display_oncall_number ;;
  }

  dimension: explicit_event_name {
    type: string
    sql: ${TABLE}.explicit_event_name ;;
  }

  dimension: is_absence {
    type: yesno
    sql: ${TABLE}.is_absence ;;
  }

  dimension: name {
    label: "task_kind.name"
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: planner_splittable {
    type: yesno
    sql: ${TABLE}.planner_splittable ;;
  }

  dimension: planning_resource_selector {
    type: string
    sql: ${TABLE}.planning_resource_selector ;;
  }

  dimension: process_moment_id {
    type: number
    sql: ${TABLE}.process_moment_id ;;
  }

  dimension: raw_rules {
    type: string
    sql: ${TABLE}.raw_rules ;;
  }

  dimension: restriction_kind_id {
    type: number
    sql: ${TABLE}.restriction_kind_id ;;
  }

  dimension: skill_resource_selector {
    type: string
    sql: ${TABLE}.skill_resource_selector ;;
  }

  dimension: splittable {
    type: yesno
    sql: ${TABLE}.splittable ;;
  }

  dimension: template_kind_id {
    type: number
    sql: ${TABLE}.template_kind_id ;;
  }

  dimension: transfer_assignment_information {
    type: yesno
    sql: ${TABLE}.transfer_assignment_information ;;
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
    drill_fields: [id, explicit_event_name, name]
  }
}
