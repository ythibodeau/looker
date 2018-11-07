view: _weekly_rows {
  sql_table_name: petalmd_development.sche__weekly_rows ;;

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

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: explicit_display_label {
    type: string
    sql: ${TABLE}.explicit_display_label ;;
  }

  dimension: explicit_print_label {
    type: string
    sql: ${TABLE}.explicit_print_label ;;
  }

  dimension: first_style {
    type: string
    sql: ${TABLE}.first_style ;;
  }

  dimension: last_style {
    type: string
    sql: ${TABLE}.last_style ;;
  }

  dimension: minimum_threshold {
    type: number
    sql: ${TABLE}.minimum_threshold ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: row_style {
    type: string
    sql: ${TABLE}.row_style ;;
  }

  dimension: skip_bottom {
    type: number
    sql: ${TABLE}.skip_bottom ;;
  }

  dimension: skip_top {
    type: number
    sql: ${TABLE}.skip_top ;;
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
