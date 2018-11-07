view: _layout_rows {
  sql_table_name: petalmd_development.sche__layout_rows ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: background_first {
    type: string
    sql: ${TABLE}.background_first ;;
  }

  dimension: background_row {
    type: string
    sql: ${TABLE}.background_row ;;
  }

  dimension: bold_first {
    type: yesno
    sql: ${TABLE}.bold_first ;;
  }

  dimension: bold_row {
    type: yesno
    sql: ${TABLE}.bold_row ;;
  }

  dimension: color_first {
    type: string
    sql: ${TABLE}.color_first ;;
  }

  dimension: color_row {
    type: string
    sql: ${TABLE}.color_row ;;
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

  dimension: cwdays_filter {
    type: string
    sql: ${TABLE}.cwdays_filter ;;
  }

  dimension: explicit_label {
    type: string
    sql: ${TABLE}.explicit_label ;;
  }

  dimension: hide_empty {
    type: yesno
    sql: ${TABLE}.hide_empty ;;
  }

  dimension: holiday_filter {
    type: string
    sql: ${TABLE}.holiday_filter ;;
  }

  dimension: layout_id {
    type: number
    sql: ${TABLE}.layout_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: show_residents {
    type: yesno
    sql: ${TABLE}.show_residents ;;
  }

  dimension: show_teachers {
    type: yesno
    sql: ${TABLE}.show_teachers ;;
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

  dimension: weekly_row_id {
    type: number
    sql: ${TABLE}.weekly_row_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
