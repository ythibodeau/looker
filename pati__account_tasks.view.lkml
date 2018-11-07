view: pati__account_tasks {
  sql_table_name: petalmd_development.pati__account_tasks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: actual_waiting_room_id {
    type: number
    sql: ${TABLE}.actual_waiting_room_id ;;
  }

  dimension: color {
    type: number
    sql: ${TABLE}.color ;;
  }

  dimension: deactivated {
    type: yesno
    sql: ${TABLE}.deactivated ;;
  }

  dimension: default {
    type: yesno
    sql: ${TABLE}.`default` ;;
  }

  dimension: explicit_external_id {
    type: string
    sql: ${TABLE}.explicit_external_id ;;
  }

  dimension: external_code {
    type: string
    sql: ${TABLE}.external_code ;;
  }

  dimension: gmf_only {
    type: yesno
    sql: ${TABLE}.gmf_only ;;
  }

  dimension: patient_filter_id {
    type: number
    sql: ${TABLE}.patient_filter_id ;;
  }

  dimension: rolling_visibility_moment {
    type: number
    sql: ${TABLE}.rolling_visibility_moment ;;
  }

  dimension: rolling_visibility_offset {
    type: number
    sql: ${TABLE}.rolling_visibility_offset ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: use_visibility_blocks {
    type: yesno
    sql: ${TABLE}.use_visibility_blocks ;;
  }

  dimension: visit_reason_choices_en {
    type: string
    sql: ${TABLE}.visit_reason_choices_en ;;
  }

  dimension: visit_reason_choices_fr_ca {
    type: string
    sql: ${TABLE}.visit_reason_choices_fr_ca ;;
  }

  dimension: visit_reason_type {
    type: number
    sql: ${TABLE}.visit_reason_type ;;
  }

  dimension: weekly_schedule {
    type: string
    sql: ${TABLE}.weekly_schedule ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      accounts.id,
      accounts.username,
      accounts.first_name,
      accounts.middle_name,
      accounts.last_name
    ]
  }
}
