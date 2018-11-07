view: pati__recall_list_cohort_runs {
  sql_table_name: petalmd_development.pati__recall_list_cohort_runs ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: cohort_id {
    type: number
    sql: ${TABLE}.cohort_id ;;
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

  dimension_group: ended {
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
    sql: ${TABLE}.ended_at ;;
  }

  dimension: next_cohort_run_id {
    type: number
    sql: ${TABLE}.next_cohort_run_id ;;
  }

  dimension: previous_cohort_run_id {
    type: number
    sql: ${TABLE}.previous_cohort_run_id ;;
  }

  dimension: recall_list_id {
    type: number
    sql: ${TABLE}.recall_list_id ;;
  }

  dimension_group: started {
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
    sql: ${TABLE}.started_at ;;
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
