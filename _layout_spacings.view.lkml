view: _layout_spacings {
  sql_table_name: petalmd_development.sche__layout_spacings ;;

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

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: layout_id {
    type: number
    sql: ${TABLE}.layout_id ;;
  }

  dimension: line_color {
    type: string
    sql: ${TABLE}.line_color ;;
  }

  dimension: line_style {
    type: string
    sql: ${TABLE}.line_style ;;
  }

  dimension: line_width {
    type: string
    sql: ${TABLE}.line_width ;;
  }

  dimension: padding {
    type: number
    sql: ${TABLE}.padding ;;
  }

  dimension: page_break {
    type: yesno
    sql: ${TABLE}.page_break ;;
  }

  dimension: row_index {
    type: number
    sql: ${TABLE}.row_index ;;
  }

  dimension: show_line {
    type: yesno
    sql: ${TABLE}.show_line ;;
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
