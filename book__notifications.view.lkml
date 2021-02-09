view: book__notifications {
  sql_table_name: petalmd.book__notifications ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: action_token {
    type: string
    sql: ${TABLE}.action_token ;;
  }

  dimension: address {
    type: string
    sql: ${TABLE}.address ;;
  }

  dimension: allow_call_back {
    type: yesno
    sql: ${TABLE}.allow_call_back ;;
  }

  dimension: allow_cancel {
    type: yesno
    sql: ${TABLE}.allow_cancel ;;
  }

  dimension: allow_confirm {
    type: yesno
    sql: ${TABLE}.allow_confirm ;;
  }

  dimension: allow_transfer {
    type: yesno
    sql: ${TABLE}.allow_transfer ;;
  }

  dimension_group: appointment {
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
    sql: ${TABLE}.appointment_time ;;
  }

  dimension: appointment_type {
    type: string
    sql: ${TABLE}.appointment_type ;;
  }

  dimension: clinic_type {
    type: string
    sql: ${TABLE}.clinic_type ;;
  }

  dimension: contact_first_name {
    type: string
    sql: ${TABLE}.contact_first_name ;;
  }

  dimension: contact_last_name {
    type: string
    sql: ${TABLE}.contact_last_name ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: instructions {
    type: string
    sql: ${TABLE}.instructions ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: max_attempts {
    type: number
    sql: ${TABLE}.max_attempts ;;
  }

  dimension: max_moment {
    type: number
    sql: ${TABLE}.max_moment ;;
  }

  dimension: media {
    type: number
    sql: ${TABLE}.media ;;
  }

  dimension: min_moment {
    type: number
    sql: ${TABLE}.min_moment ;;
  }

  dimension: patient_first_name {
    type: string
    sql: ${TABLE}.patient_first_name ;;
  }

  dimension: patient_last_name {
    type: string
    sql: ${TABLE}.patient_last_name ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: queued_notification_id {
    type: number
    sql: ${TABLE}.queued_notification_id ;;
  }

  dimension: requested_service {
    type: string
    sql: ${TABLE}.requested_service ;;
  }

  dimension: resource_name {
    type: string
    sql: ${TABLE}.resource_name ;;
  }

  dimension: specialty {
    type: string
    sql: ${TABLE}.specialty ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
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
      patient_first_name,
      patient_last_name,
      contact_first_name,
      contact_last_name,
      resource_name,
      book__notification_templates.clean_media,
      book__queued_notifications.status,
      book__queued_notification_deliveries.error_data

    ]
  }
}
