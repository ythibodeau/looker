view: notifications {
  sql_table_name: petalmd.notifications ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
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

  dimension: discussion_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.discussion_id ;;
  }

  dimension: hidden {
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension: last_delivery_service_id {
    type: number
    sql: ${TABLE}.last_delivery_service_id ;;
  }

  dimension: notification_kind_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.notification_kind_id ;;
  }

  dimension: pending {
    type: yesno
    sql: ${TABLE}.pending ;;
  }

  dimension: read {
    type: yesno
    sql: ${TABLE}.`read` ;;
  }

  dimension_group: read {
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
    sql: ${TABLE}.read_at ;;
  }

  dimension: topic_id {
    type: number
    sql: ${TABLE}.topic_id ;;
  }

  dimension: topic_type {
    type: string
    sql: ${TABLE}.topic_type ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      accounts.id,
      accounts.username,
      accounts.first_name,
      accounts.middle_name,
      accounts.last_name,
      discussions.id,
      notification_kinds.id,
      book__notification_deliveries.count,
      deliveries.count
    ]
  }
}