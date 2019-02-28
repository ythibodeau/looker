view: book__queued_notifications {
  sql_table_name: petalmd.book__queued_notifications ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: acknowledged_by_third_party {
    type: yesno
    sql: ${TABLE}.acknowledged_by_third_party ;;
  }

  dimension: action {
    type: number
    sql: ${TABLE}.action ;;
  }

  dimension: api_payload {
    type: string
    sql: ${TABLE}.api_payload ;;
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

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: external_id_to_cancel {
    type: string
    sql: ${TABLE}.external_id_to_cancel ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: processed {
    type: yesno
    sql: ${TABLE}.processed ;;
  }

  dimension: status {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.status = 10 THEN "Not Found"
      WHEN ${TABLE}.status =  8 THEN "Cancelled"
      WHEN ${TABLE}.status =  9 THEN "Already Sent"
      WHEN ${TABLE}.status =  99 THEN "No Matching Template"
      WHEN ${TABLE}.status =  0 THEN "No Action Required/Hung up"
      WHEN ${TABLE}.status =  1 THEN "Confirmed Action"
      WHEN ${TABLE}.status =  2 THEN "Cancelled Action"
      WHEN ${TABLE}.status =  3 THEN "Transfer Action"
      WHEN ${TABLE}.status =  4 THEN "Callback Action"
      WHEN ${TABLE}.status =  5 THEN "Wrong Recipient Action"
      WHEN ${TABLE}.status =  6 THEN "No Answer"
      WHEN ${TABLE}.status =  99 THEN "Missing Field/Invalid Data"
      WHEN ${TABLE}.status =  11 THEN "Voice Mail"
    END
     ;;
  }

  dimension_group: status_change {
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
    sql: ${TABLE}.status_change_time ;;
  }

  dimension: template_group_id {
    type: number
    sql: ${TABLE}.template_group_id ;;
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
    drill_fields: [id, groups.name, groups.parent_group_id]
  }
}
