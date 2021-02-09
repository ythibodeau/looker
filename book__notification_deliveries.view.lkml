view: book__notification_deliveries {
  sql_table_name: petalmd.book__notification_deliveries ;;

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

  dimension: duration {
    type: number
    sql: ${TABLE}.duration ;;
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

  dimension: error_data {
    type: string
    sql: ${TABLE}.error_data ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: identity_verified {
    type: yesno
    sql: ${TABLE}.identity_verified ;;
  }

  dimension: length {
    type: number
    sql: ${TABLE}.length ;;
  }

  dimension: notification_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.notification_id ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent_at ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: clean_status {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.status = 0 THEN "Pending"
      WHEN ${TABLE}.status = 1 THEN "Success"
      WHEN ${TABLE}.status = 2 THEN "Failure"
    END;;
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
    drill_fields:
    [
    id,
    notifications.id,
    book__notifications.created_time,
    book__notification_templates.clean_media,
    book__queued_notifications.acknowledged_by_third_party,
    sent_time,
    book__queued_notifications.petal_status,
    book__queued_notifications.logibec_response_code
      ]
  }
}
