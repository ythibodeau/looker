view: sche__console_layout_rows {
  sql_table_name: petalmd.sche__console_layout_rows ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: background_first {
    type: string
    sql: ${TABLE}.background_first ;;
  }

  dimension: background_petalweb {
    type: string
    sql: ${TABLE}.background_petalweb ;;
  }

  dimension: background_row {
    type: string
    sql: ${TABLE}.background_row ;;
  }

  dimension: console_layout_id {
    type: number
    sql: ${TABLE}.console_layout_id ;;
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

  dimension: label {
    type: string
    sql: ${TABLE}.label ;;
  }

  dimension: schedule_row_id {
    type: number
    sql: ${TABLE}.schedule_row_id ;;
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
