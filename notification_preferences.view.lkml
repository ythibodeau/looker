view: notification_preferences {
  sql_table_name: petalmd.notification_preferences ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: absence_email {
    type: yesno
    sql: ${TABLE}.absence_email ;;
  }

  dimension: absence_push {
    type: yesno
    sql: ${TABLE}.absence_push ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
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

  dimension: event_email {
    type: yesno
    sql: ${TABLE}.event_email ;;
  }

  dimension: event_push {
    type: yesno
    sql: ${TABLE}.event_push ;;
  }

  dimension: marketing_email {
    type: yesno
    sql: ${TABLE}.marketing_email ;;
  }

  dimension: marketing_push {
    type: yesno
    sql: ${TABLE}.marketing_push ;;
  }

  dimension: marketplace_email {
    type: yesno
    sql: ${TABLE}.marketplace_email ;;
  }

  dimension: marketplace_push {
    type: yesno
    sql: ${TABLE}.marketplace_push ;;
  }

  dimension: message_email {
    type: yesno
    sql: ${TABLE}.message_email ;;
  }

  dimension: message_push {
    type: yesno
    sql: ${TABLE}.message_push ;;
  }

  dimension: task_email {
    type: yesno
    sql: ${TABLE}.task_email ;;
  }

  dimension: task_push {
    type: yesno
    sql: ${TABLE}.task_push ;;
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

  dimension: weekly_digest_email {
    type: yesno
    sql: ${TABLE}.weekly_digest_email ;;
  }

  dimension: weekly_digest_push {
    type: yesno
    sql: ${TABLE}.weekly_digest_push ;;
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
      accounts.last_name
    ]
  }
}