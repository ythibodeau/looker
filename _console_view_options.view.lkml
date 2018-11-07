view: _console_view_options {
  sql_table_name: petalmd_development.sche__console_view_options ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: console_row_id {
    type: number
    sql: ${TABLE}.console_row_id ;;
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

  dimension: view_option {
    type: number
    sql: ${TABLE}.view_option ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
