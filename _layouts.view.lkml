view: _layouts {
  sql_table_name: petalmd_development.sche__layouts ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: break_table {
    type: yesno
    sql: ${TABLE}.break_table ;;
  }

  dimension: compact_fit {
    type: yesno
    sql: ${TABLE}.compact_fit ;;
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

  dimension: explicit_display_label {
    type: string
    sql: ${TABLE}.explicit_display_label ;;
  }

  dimension: highlight_resources {
    type: yesno
    sql: ${TABLE}.highlight_resources ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: label_height {
    type: string
    sql: ${TABLE}.label_height ;;
  }

  dimension: label_width {
    type: string
    sql: ${TABLE}.label_width ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: one_week_per_page {
    type: yesno
    sql: ${TABLE}.one_week_per_page ;;
  }

  dimension: page_orientation {
    type: yesno
    sql: ${TABLE}.page_orientation ;;
  }

  dimension: page_size {
    type: string
    sql: ${TABLE}.page_size ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: prioritize_order_by_layout_row {
    type: yesno
    sql: ${TABLE}.prioritize_order_by_layout_row ;;
  }

  dimension: resource_selector {
    type: string
    sql: ${TABLE}.resource_selector ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: show_absences {
    type: string
    sql: ${TABLE}.show_absences ;;
  }

  dimension: show_absences_on_weekend {
    type: yesno
    sql: ${TABLE}.show_absences_on_weekend ;;
  }

  dimension: show_am_pm {
    type: yesno
    sql: ${TABLE}.show_am_pm ;;
  }

  dimension: show_assignments {
    type: yesno
    sql: ${TABLE}.show_assignments ;;
  }

  dimension: show_initials {
    type: yesno
    sql: ${TABLE}.show_initials ;;
  }

  dimension: show_oncall_number {
    type: yesno
    sql: ${TABLE}.show_oncall_number ;;
  }

  dimension: show_task_found {
    type: yesno
    sql: ${TABLE}.show_task_found ;;
  }

  dimension: show_weekends {
    type: yesno
    sql: ${TABLE}.show_weekends ;;
  }

  dimension: task_selector {
    type: string
    sql: ${TABLE}.task_selector ;;
  }

  dimension: temporary {
    type: yesno
    sql: ${TABLE}.temporary ;;
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
