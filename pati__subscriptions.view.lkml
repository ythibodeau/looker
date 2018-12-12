view: pati__subscriptions {
  sql_table_name: petalmd_development.pati__subscriptions ;;

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

  dimension_group: disabled {
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
    sql: ${TABLE}.disabled_at ;;
  }

  dimension: disabled_by_id {
    type: number
    sql: ${TABLE}.disabled_by_id ;;
  }

  dimension: external_account_id {
    type: string
    sql: ${TABLE}.external_account_id ;;
  }

  dimension: external_last_revision {
    type: string
    sql: ${TABLE}.external_last_revision ;;
  }

  dimension: external_patient_id {
    type: string
    sql: ${TABLE}.external_patient_id ;;
  }

  dimension: file_number {
    type: string
    sql: ${TABLE}.file_number ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: is_anonymous {
    type: yesno
    sql: ${TABLE}.is_anonymous ;;
  }

  dimension: is_new_patient {
    type: yesno
    sql: ${TABLE}.is_new_patient ;;
  }

  dimension: is_syncing {
    type: yesno
    sql: ${TABLE}.is_syncing ;;
  }

  dimension: notification_preference {
    type: number
    sql: ${TABLE}.notification_preference ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension_group: period_opening_notification {
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
    sql: ${TABLE}.period_opening_notification_date ;;
  }

  dimension: period_opening_notification_kind {
    type: number
    sql: ${TABLE}.period_opening_notification_kind ;;
  }

  dimension: prevent_booking {
    type: yesno
    sql: ${TABLE}.prevent_booking ;;
  }

  dimension: prevent_booking_comment {
    type: string
    sql: ${TABLE}.prevent_booking_comment ;;
  }

  dimension_group: prevent_booking_end {
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
    sql: ${TABLE}.prevent_booking_end_date ;;
  }

  dimension: profile_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.profile_id ;;
  }

  dimension: sharing_consent {
    type: yesno
    sql: ${TABLE}.sharing_consent ;;
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

  measure: last_subscription_date {
    type: date
    sql: max(${created_date}) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      groups.name,
      groups.parent_group_id,
      accounts.id,
      accounts.username,
      accounts.first_name,
      accounts.middle_name,
      accounts.last_name,
      profiles.id
    ]
  }
}
