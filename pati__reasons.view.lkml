view: pati__reasons {
  sql_table_name: petalmd.pati__reasons ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_filter {
    type: number
    sql: ${TABLE}.account_filter ;;
  }

  dimension: actual_waiting_room_id {
    type: number
    sql: ${TABLE}.actual_waiting_room_id ;;
  }

  dimension: allow_consecutive_appointments {
    type: yesno
    sql: ${TABLE}.allow_consecutive_appointments ;;
  }

  dimension: allow_select_hcp {
    type: yesno
    sql: ${TABLE}.allow_select_hcp ;;
  }

  dimension: allow_time_preference {
    type: yesno
    sql: ${TABLE}.allow_time_preference ;;
  }

  dimension: appointment_period_required {
    type: yesno
    sql: ${TABLE}.appointment_period_required ;;
  }

  dimension: cancellation_time_limit {
    type: number
    sql: ${TABLE}.cancellation_time_limit ;;
  }

  dimension: cancellation_time_limit_kind {
    type: number
    sql: ${TABLE}.cancellation_time_limit_kind ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
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

  dimension: deactivated {
    type: yesno
    sql: ${TABLE}.deactivated ;;
  }

  dimension: description_en {
    type: string
    sql: ${TABLE}.description_en ;;
  }

  dimension: description_fr_ca {
    type: string
    sql: ${TABLE}.description_fr_ca ;;
  }

  dimension: disable_notifications {
    type: yesno
    sql: ${TABLE}.disable_notifications ;;
  }

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: fallback_reason_id {
    type: number
    sql: ${TABLE}.fallback_reason_id ;;
  }

  dimension: fallback_reason_only_when_none {
    type: yesno
    sql: ${TABLE}.fallback_reason_only_when_none ;;
  }

  dimension: family_doctor_priority {
    type: yesno
    sql: ${TABLE}.family_doctor_priority ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: long_term_reminder_offset {
    type: number
    sql: ${TABLE}.long_term_reminder_offset ;;
  }

  dimension: offering_id {
    type: number
    sql: ${TABLE}.offering_id ;;
  }

  dimension: patient_filter_id {
    type: number
    sql: ${TABLE}.patient_filter_id ;;
  }

  dimension: patient_message_with_family_doctor_en {
    type: string
    sql: ${TABLE}.patient_message_with_family_doctor_en ;;
  }

  dimension: patient_message_with_family_doctor_fr_ca {
    type: string
    sql: ${TABLE}.patient_message_with_family_doctor_fr_ca ;;
  }

  dimension: patient_message_without_family_doctor_en {
    type: string
    sql: ${TABLE}.patient_message_without_family_doctor_en ;;
  }

  dimension: patient_message_without_family_doctor_fr_ca {
    type: string
    sql: ${TABLE}.patient_message_without_family_doctor_fr_ca ;;
  }

  dimension: prohibited_message_en {
    type: string
    sql: ${TABLE}.prohibited_message_en ;;
  }

  dimension: prohibited_message_fr_ca {
    type: string
    sql: ${TABLE}.prohibited_message_fr_ca ;;
  }

  dimension: ratio_expiry_moment {
    type: number
    sql: ${TABLE}.ratio_expiry_moment ;;
  }

  dimension: ratio_family_doctor {
    type: number
    sql: ${TABLE}.ratio_family_doctor ;;
  }

  dimension: ratio_non_family_doctor {
    type: number
    sql: ${TABLE}.ratio_non_family_doctor ;;
  }

  dimension: reminder_sms_text_en {
    type: string
    sql: ${TABLE}.reminder_sms_text_en ;;
  }

  dimension: reminder_sms_text_fr_ca {
    type: string
    sql: ${TABLE}.reminder_sms_text_fr_ca ;;
  }

  dimension: reminder_sms_text_override {
    type: yesno
    sql: ${TABLE}.reminder_sms_text_override ;;
  }

  dimension: reminder_text_en {
    type: string
    sql: ${TABLE}.reminder_text_en ;;
  }

  dimension: reminder_text_fr_ca {
    type: string
    sql: ${TABLE}.reminder_text_fr_ca ;;
  }

  dimension: rolling_visibility_moment {
    type: number
    sql: ${TABLE}.rolling_visibility_moment ;;
  }

  dimension: rolling_visibility_offset {
    type: number
    sql: ${TABLE}.rolling_visibility_offset ;;
  }

  dimension: short_term_reminder_offset {
    type: number
    sql: ${TABLE}.short_term_reminder_offset ;;
  }

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
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

  dimension: use_visibility_blocks {
    type: yesno
    sql: ${TABLE}.use_visibility_blocks ;;
  }

  dimension: visit_reason_choices_en {
    type: string
    sql: ${TABLE}.visit_reason_choices_en ;;
  }

  dimension: visit_reason_choices_fr_ca {
    type: string
    sql: ${TABLE}.visit_reason_choices_fr_ca ;;
  }

  dimension: visit_reason_type {
    type: number
    sql: ${TABLE}.visit_reason_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, groups.name, groups.parent_group_id]
  }
}