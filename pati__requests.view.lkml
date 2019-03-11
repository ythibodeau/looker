view: pati__requests {
  sql_table_name: petalmd.pati__requests ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: appointment_id {
    type: number
    sql: ${TABLE}.appointment_id ;;
  }

  dimension: cancellation_reason {
    type: string
    sql: ${TABLE}.cancellation_reason ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled_at ;;
  }

  dimension: cancelled_by_id {
    type: number
    sql: ${TABLE}.cancelled_by_id ;;
  }

  dimension: cancelled_by_type {
    type: string
    sql: ${TABLE}.cancelled_by_type ;;
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

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: created_by_type {
    type: string
    sql: ${TABLE}.created_by_type ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: is_cancelled {
    type: yesno
    sql: ${TABLE}.is_cancelled ;;
  }

  dimension: moments_of_day {
    type: string
    sql: ${TABLE}.moments_of_day ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: target_service_id {
    type: number
    sql: ${TABLE}.target_service_id ;;
  }

  dimension: target_service_type {
    type: string
    sql: ${TABLE}.target_service_type ;;
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

  dimension: updated_by_id {
    type: number
    sql: ${TABLE}.updated_by_id ;;
  }

  dimension: updated_by_type {
    type: string
    sql: ${TABLE}.updated_by_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, groups.name, groups.parent_group_id]
  }
}