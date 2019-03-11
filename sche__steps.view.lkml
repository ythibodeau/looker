view: sche__steps {
  sql_table_name: petalmd.sche__steps ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: absence_selector {
    type: string
    sql: ${TABLE}.absence_selector ;;
  }

  dimension: automatic {
    type: yesno
    sql: ${TABLE}.automatic ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: context {
    type: string
    sql: ${TABLE}.context ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: equity_packs {
    type: string
    sql: ${TABLE}.equity_packs ;;
  }

  dimension: ignore_availability_constraints {
    type: yesno
    sql: ${TABLE}.ignore_availability_constraints ;;
  }

  dimension: ignore_equity_packs {
    type: yesno
    sql: ${TABLE}.ignore_equity_packs ;;
  }

  dimension: ignore_other_constraints {
    type: yesno
    sql: ${TABLE}.ignore_other_constraints ;;
  }

  dimension: ignore_requirements {
    type: yesno
    sql: ${TABLE}.ignore_requirements ;;
  }

  dimension: ignore_skills {
    type: yesno
    sql: ${TABLE}.ignore_skills ;;
  }

  dimension: ignore_task_blockings {
    type: yesno
    sql: ${TABLE}.ignore_task_blockings ;;
  }

  dimension: pairing_complete_patterns {
    type: yesno
    sql: ${TABLE}.pairing_complete_patterns ;;
  }

  dimension: pairing_directive {
    type: string
    sql: ${TABLE}.pairing_directive ;;
  }

  dimension: pairing_selectors {
    type: string
    sql: ${TABLE}.pairing_selectors ;;
  }

  dimension: resource_axis {
    type: yesno
    sql: ${TABLE}.resource_axis ;;
  }

  dimension: resource_directive {
    type: string
    sql: ${TABLE}.resource_directive ;;
  }

  dimension: resource_selector {
    type: string
    sql: ${TABLE}.resource_selector ;;
  }

  dimension: rotation_id {
    type: number
    sql: ${TABLE}.rotation_id ;;
  }

  dimension: rotation_start_week {
    type: number
    sql: ${TABLE}.rotation_start_week ;;
  }

  dimension: script_id {
    type: number
    sql: ${TABLE}.script_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: subset_id {
    type: number
    sql: ${TABLE}.subset_id ;;
  }

  dimension: task_driven {
    type: yesno
    sql: ${TABLE}.task_driven ;;
  }

  dimension: task_selector {
    type: string
    sql: ${TABLE}.task_selector ;;
  }

  dimension: task_sequence {
    type: string
    sql: ${TABLE}.task_sequence ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
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

  dimension: use_quadratic_equity {
    type: yesno
    sql: ${TABLE}.use_quadratic_equity ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: automatic_count {
    type: count
    filters: {
      field: automatic
      value: "Yes"
    }
  }
}