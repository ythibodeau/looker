view: sche__periods {
  sql_table_name: petalmd_development.sche__periods ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: absence_date_range_id {
    type: number
    sql: ${TABLE}.absence_date_range_id ;;
  }

  dimension_group: absences_due {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.absences_due_date ;;
  }

  dimension: allow_merge_am_pm {
    type: yesno
    sql: ${TABLE}.allow_merge_am_pm ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension_group: confirmed {
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
    sql: ${TABLE}.confirmed_at ;;
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

  dimension: current_job_id {
    type: string
    sql: ${TABLE}.current_job_id ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: equity_values_transferred {
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
    sql: ${TABLE}.equity_values_transferred_at ;;
  }

  dimension_group: generated {
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
    sql: ${TABLE}.generated_at ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: label_height {
    type: string
    sql: ${TABLE}.label_height ;;
  }

  dimension: label_width {
    type: string
    sql: ${TABLE}.label_width ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: published {
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
    sql: ${TABLE}.published_at ;;
  }

  dimension: ready_to_plan {
    type: yesno
    sql: ${TABLE}.ready_to_plan ;;
  }

  dimension_group: released {
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
    sql: ${TABLE}.released_at ;;
  }

  dimension: sequence_by_equity_first {
    type: yesno
    sql: ${TABLE}.sequence_by_equity_first ;;
  }

  dimension: sourcing_id {
    type: number
    sql: ${TABLE}.sourcing_id ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: synchronized {
    type: yesno
    sql: ${TABLE}.synchronized ;;
  }

  dimension: training {
    type: yesno
    sql: ${TABLE}.training ;;
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
    drill_fields: [id, name]
  }
}
