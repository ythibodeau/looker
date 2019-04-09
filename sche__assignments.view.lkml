view: sche__assignments {
  sql_table_name: petalmd.sche__assignments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: annotation {
    type: string
    sql: ${TABLE}.annotation ;;
  }

  dimension: approved {
    type: yesno
    sql: ${TABLE}.approved ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
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

  dimension: end_moment {
    type: number
    sql: ${TABLE}.end_moment ;;
  }

  dimension: modified_after_confirmation {
    type: yesno
    sql: ${TABLE}.modified_after_confirmation ;;
  }

  dimension: period_history_id {
    type: number
    sql: ${TABLE}.period_history_id ;;
  }

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
  }

  dimension: requirement_id {
    type: number
    sql: ${TABLE}.requirement_id ;;
  }

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
  }

  dimension: split {
    type: yesno
    sql: ${TABLE}.split ;;
  }

  dimension: split_next_day {
    type: yesno
    sql: ${TABLE}.split_next_day ;;
  }

  dimension: start_moment {
    type: number
    sql: ${TABLE}.start_moment ;;
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

  dimension: is_manual {
    type: yesno
    sql: ${sche__period_histories.source_type} IN (0,6) ;;
  }

  dimension: is_automatic {
    type: yesno
    sql: ${sche__period_histories.source_type} IN (1,2) ;;
  }

  measure: is_manual_count {
    type: count_distinct
    sql: ${sche__assignments.id} ;;
    filters: {
      field: is_manual
      value: "Yes"
    }
  }

  measure: is_automatic_count {
    type: count_distinct
    sql: ${sche__assignments.id} ;;
    filters: {
      field: is_automatic
      value: "Yes"
    }
  }
}
