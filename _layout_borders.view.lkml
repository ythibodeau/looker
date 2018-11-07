view: _layout_borders {
  sql_table_name: petalmd_development.sche__layout_borders ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}.color ;;
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

  dimension: end_index {
    type: number
    sql: ${TABLE}.end_index ;;
  }

  dimension: layout_id {
    type: number
    sql: ${TABLE}.layout_id ;;
  }

  dimension: start_index {
    type: number
    sql: ${TABLE}.start_index ;;
  }

  dimension: style {
    type: string
    sql: ${TABLE}.style ;;
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

  dimension: width {
    type: string
    sql: ${TABLE}.width ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
