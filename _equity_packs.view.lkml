view: _equity_packs {
  sql_table_name: petalmd_development.sche__equity_packs ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: base_units {
    type: number
    sql: ${TABLE}.base_units ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: count_matching_days {
    type: yesno
    sql: ${TABLE}.count_matching_days ;;
  }

  dimension: count_unique_days {
    type: yesno
    sql: ${TABLE}.count_unique_days ;;
  }

  dimension: counter {
    type: yesno
    sql: ${TABLE}.counter ;;
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

  dimension: display {
    type: yesno
    sql: ${TABLE}.display ;;
  }

  dimension: exclude_even {
    type: yesno
    sql: ${TABLE}.exclude_even ;;
  }

  dimension: exclude_odd {
    type: yesno
    sql: ${TABLE}.exclude_odd ;;
  }

  dimension: explicit_tolerance {
    type: number
    sql: ${TABLE}.explicit_tolerance ;;
  }

  dimension: explicit_total {
    type: number
    sql: ${TABLE}.explicit_total ;;
  }

  dimension: explicit_weight {
    type: number
    sql: ${TABLE}.explicit_weight ;;
  }

  dimension: has_adjustments {
    type: yesno
    sql: ${TABLE}.has_adjustments ;;
  }

  dimension: has_previous {
    type: yesno
    sql: ${TABLE}.has_previous ;;
  }

  dimension: is_included {
    type: yesno
    sql: ${TABLE}.is_included ;;
  }

  dimension: limiting {
    type: yesno
    sql: ${TABLE}.limiting ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: task_selector {
    type: string
    sql: ${TABLE}.task_selector ;;
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
