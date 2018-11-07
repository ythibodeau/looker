view: record_merger_logs {
  sql_table_name: petalmd_development.record_merger_logs ;;

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

  dimension: current_group_id {
    type: number
    sql: ${TABLE}.current_group_id ;;
  }

  dimension: merge_context {
    type: string
    sql: ${TABLE}.merge_context ;;
  }

  dimension: merge_status {
    type: number
    sql: ${TABLE}.merge_status ;;
  }

  dimension: merged_by_id {
    type: number
    sql: ${TABLE}.merged_by_id ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension: target_id {
    type: number
    sql: ${TABLE}.target_id ;;
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
