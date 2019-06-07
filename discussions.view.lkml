view: discussions {
  sql_table_name: petalmd.discussions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
    html: <span title="{{discussions.participants_count._value}}"> {{rendered_value}} </span> ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: assembla_ticket {
    type: string
    sql: ${TABLE}.assembla_ticket ;;
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

  dimension: deployed {
    type: string
    sql: ${TABLE}.deployed ;;
  }

  dimension: distribution_list_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.distribution_list_id ;;
  }

  dimension: draft {
    type: yesno
    sql: ${TABLE}.draft ;;
  }

  dimension: erep {
    type: yesno
    sql: ${TABLE}.erep ;;
  }

  dimension: forward_from_comment_id {
    type: number
    sql: ${TABLE}.forward_from_comment_id ;;
  }

  dimension: from_console_layout_id {
    type: number
    sql: ${TABLE}.from_console_layout_id ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension_group: last_comment {
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
    sql: ${TABLE}.last_comment_at ;;
  }

  dimension: monologue {
    type: yesno
    sql: ${TABLE}.monologue ;;
  }

  dimension: notifications_enabled {
    type: yesno
    sql: ${TABLE}.notifications_enabled ;;
  }

  dimension: originating_comment_id {
    type: number
    sql: ${TABLE}.originating_comment_id ;;
  }

  dimension: posted_as_group {
    type: yesno
    sql: ${TABLE}.posted_as_group ;;
  }

  dimension: private {
    type: yesno
    sql: ${TABLE}.private ;;
  }

  dimension: reply_disabled {
    type: yesno
    sql: ${TABLE}.reply_disabled ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: support {
    type: yesno
    sql: ${TABLE}.support ;;
  }

  dimension: support_escalation {
    type: yesno
    sql: ${TABLE}.support_escalation ;;
  }

  dimension: support_group_id {
    type: number
    sql: ${TABLE}.support_group_id ;;
  }

  dimension: support_kind_id {
    type: number
    sql: ${TABLE}.support_kind_id ;;
  }

  dimension: support_priority_id {
    type: number
    sql: ${TABLE}.support_priority_id ;;
  }

  dimension: support_source_id {
    type: number
    sql: ${TABLE}.support_source_id ;;
  }

  dimension: support_status_id {
    type: number
    sql: ${TABLE}.support_status_id ;;
  }

  dimension: support_type_id {
    type: number
    sql: ${TABLE}.support_type_id ;;
  }

  dimension: support_user_id {
    type: number
    sql: ${TABLE}.support_user_id ;;
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

  dimension: urgent {
    type: yesno
    sql: ${TABLE}.urgent ;;
  }

  dimension: recipient_types {
    type: string
    sql: ${recipients.recipientable_type} ;;
  }

  measure: recipient_types_list {
    type: list
    list_field: recipient_types
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: participants_count {
    type: count_distinct
    sql: ${participants.account_id} ;;
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
      groups.name,
      groups.parent_group_id,
      distribution_lists.id,
      distribution_lists.name,
      comments.count,
      discussion_flags.count,
      notifications.count,
      participants.count,
      recipients.count
    ]
  }
}
