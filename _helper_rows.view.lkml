view: _helper_rows {
  sql_table_name: petalmd_development.sche__helper_rows ;;

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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: display_label {
    type: string
    sql: ${TABLE}.display_label ;;
  }

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: maximum_threshold {
    type: number
    sql: ${TABLE}.maximum_threshold ;;
  }

  dimension: minimum_threshold {
    type: number
    sql: ${TABLE}.minimum_threshold ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: print_label {
    type: string
    sql: ${TABLE}.print_label ;;
  }

  dimension: raw_rules {
    type: string
    sql: ${TABLE}.raw_rules ;;
  }

  dimension: reverse_thresholds {
    type: yesno
    sql: ${TABLE}.reverse_thresholds ;;
  }

  dimension: show_as_count {
    type: yesno
    sql: ${TABLE}.show_as_count ;;
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
