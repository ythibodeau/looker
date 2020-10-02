view: groups_in_console {
  derived_table: {
    sql: select distinct g.* from groups g
      inner join console_content_groups ccg on g.id = ccg.content_group_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: acronym {
    type: string
    sql: ${TABLE}.acronym ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: schedules_enabled {
    type: string
    sql: ${TABLE}.schedules_enabled ;;
  }

  dimension: absences_due_date {
    type: date
    sql: ${TABLE}.absences_due_date ;;
  }

  dimension: next_period_start_date {
    type: date
    sql: ${TABLE}.next_period_start_date ;;
  }

  dimension: next_period_end_date {
    type: date
    sql: ${TABLE}.next_period_end_date ;;
  }

  dimension: auto_process {
    type: string
    sql: ${TABLE}.auto_process ;;
  }

  dimension: parent_group_id {
    type: number
    sql: ${TABLE}.parent_group_id ;;
  }

  dimension: absences_public {
    type: string
    sql: ${TABLE}.absences_public ;;
  }

  dimension: residents_label {
    type: string
    sql: ${TABLE}.residents_label ;;
  }

  dimension: allow_edit_own_assignments {
    type: string
    sql: ${TABLE}.allow_edit_own_assignments ;;
  }

  dimension: absences_include_holidays {
    type: string
    sql: ${TABLE}.absences_include_holidays ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: specialty_id {
    type: number
    sql: ${TABLE}.specialty_id ;;
  }

  dimension: allow_xls_print {
    type: string
    sql: ${TABLE}.allow_xls_print ;;
  }

  dimension: member_activation_message {
    type: string
    sql: ${TABLE}.member_activation_message ;;
  }

  dimension: absences_include_weekends {
    type: string
    sql: ${TABLE}.absences_include_weekends ;;
  }

  dimension: absences_include_oncall {
    type: string
    sql: ${TABLE}.absences_include_oncall ;;
  }

  dimension: inactive {
    type: string
    sql: ${TABLE}.inactive ;;
  }

  dimension: key_customer {
    type: string
    sql: ${TABLE}.key_customer ;;
  }

  dimension: script_creator_id {
    type: number
    sql: ${TABLE}.script_creator_id ;;
  }

  dimension: period_count_per_year {
    type: number
    sql: ${TABLE}.period_count_per_year ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: centre_id {
    type: number
    sql: ${TABLE}.centre_id ;;
  }

  dimension: merge_ampm_as_day {
    type: string
    sql: ${TABLE}.merge_ampm_as_day ;;
  }

  dimension: show_profile_info {
    type: string
    sql: ${TABLE}.show_profile_info ;;
  }

  dimension: invalid_change_request_behavior {
    type: string
    sql: ${TABLE}.invalid_change_request_behavior ;;
  }

  dimension: console_enabled {
    type: string
    sql: ${TABLE}.console_enabled ;;
  }

  dimension: hospital_id {
    type: number
    sql: ${TABLE}.hospital_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: timezone_id {
    type: number
    sql: ${TABLE}.timezone_id ;;
  }

  dimension: use_confidential_email {
    type: string
    sql: ${TABLE}.use_confidential_email ;;
  }

  dimension: absences_restriction_enabled {
    type: string
    sql: ${TABLE}.absences_restriction_enabled ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: implementation {
    type: string
    sql: ${TABLE}.implementation ;;
  }

  dimension: excluded {
    type: string
    sql: ${TABLE}.excluded ;;
  }

  dimension: is_beta_tester {
    type: string
    sql: ${TABLE}.is_beta_tester ;;
  }

  dimension: premium_customer {
    type: string
    sql: ${TABLE}.premium_customer ;;
  }

  dimension: auto_approve {
    type: string
    sql: ${TABLE}.auto_approve ;;
  }

  dimension: late_threshold_weeks {
    type: number
    sql: ${TABLE}.late_threshold_weeks ;;
  }

  dimension: send_activation_email {
    type: string
    sql: ${TABLE}.send_activation_email ;;
  }

  dimension: zendesk_id {
    type: number
    sql: ${TABLE}.zendesk_id ;;
  }

  dimension: zendesk_in_sync {
    type: string
    sql: ${TABLE}.zendesk_in_sync ;;
  }

  dimension: address_line_1 {
    type: string
    sql: ${TABLE}.address_line_1 ;;
  }

  dimension: address_line_2 {
    type: string
    sql: ${TABLE}.address_line_2 ;;
  }

  dimension: address_line_3 {
    type: string
    sql: ${TABLE}.address_line_3 ;;
  }

  dimension: has_mass_import {
    type: string
    sql: ${TABLE}.has_mass_import ;;
  }

  dimension: accepts_new_patients {
    type: string
    sql: ${TABLE}.accepts_new_patients ;;
  }

  dimension: patient_dashboard_start_time {
    type: string
    sql: ${TABLE}.patient_dashboard_start_time ;;
  }

  dimension: patient_dashboard_end_time {
    type: string
    sql: ${TABLE}.patient_dashboard_end_time ;;
  }

  dimension: spoken_name_fr_ca {
    type: string
    sql: ${TABLE}.spoken_name_fr_ca ;;
  }

  dimension: spoken_name_en {
    type: string
    sql: ${TABLE}.spoken_name_en ;;
  }

  dimension: from_phone_number {
    type: string
    sql: ${TABLE}.from_phone_number ;;
  }

  dimension: minimum_availability_duration {
    type: number
    sql: ${TABLE}.minimum_availability_duration ;;
  }

  dimension: surrogate_subscription_id {
    type: number
    sql: ${TABLE}.surrogate_subscription_id ;;
  }

  dimension: accepts_anonymous_patients {
    type: string
    sql: ${TABLE}.accepts_anonymous_patients ;;
  }

  dimension: availability_threshold_kind {
    type: number
    sql: ${TABLE}.availability_threshold_kind ;;
  }

  dimension: availability_threshold_value {
    type: number
    sql: ${TABLE}.availability_threshold_value ;;
  }

  dimension: family_doctor_label_en {
    type: string
    sql: ${TABLE}.family_doctor_label_en ;;
  }

  dimension: family_doctor_label_fr_ca {
    type: string
    sql: ${TABLE}.family_doctor_label_fr_ca ;;
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

  dimension: trial_subscription_id {
    type: number
    sql: ${TABLE}.trial_subscription_id ;;
  }

  dimension: trial_patient_password {
    type: string
    sql: ${TABLE}.trial_patient_password ;;
  }

  dimension: long_term_reminder_offset {
    type: number
    sql: ${TABLE}.long_term_reminder_offset ;;
  }

  dimension: short_term_reminder_offset {
    type: number
    sql: ${TABLE}.short_term_reminder_offset ;;
  }

  dimension: phone_daily_threshold_lower_moment {
    type: number
    sql: ${TABLE}.phone_daily_threshold_lower_moment ;;
  }

  dimension: phone_daily_threshold_upper_moment {
    type: number
    sql: ${TABLE}.phone_daily_threshold_upper_moment ;;
  }

  dimension: hubspot_id {
    type: string
    sql: ${TABLE}.hubspot_id ;;
  }

  dimension: mandatory_fields_before_booking {
    type: string
    sql: ${TABLE}.mandatory_fields_before_booking ;;
  }

  dimension: reminder_text_en {
    type: string
    sql: ${TABLE}.reminder_text_en ;;
  }

  dimension: reminder_text_fr_ca {
    type: string
    sql: ${TABLE}.reminder_text_fr_ca ;;
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
    type: string
    sql: ${TABLE}.reminder_sms_text_override ;;
  }

  dimension: reminder_phone_text_en {
    type: string
    sql: ${TABLE}.reminder_phone_text_en ;;
  }

  dimension: reminder_phone_text_fr_ca {
    type: string
    sql: ${TABLE}.reminder_phone_text_fr_ca ;;
  }

  dimension: reminder_phone_text_override {
    type: string
    sql: ${TABLE}.reminder_phone_text_override ;;
  }

  dimension: validate_hin {
    type: string
    sql: ${TABLE}.validate_hin ;;
  }

  dimension: explicit_sms_from_phone_number {
    type: string
    sql: ${TABLE}.explicit_sms_from_phone_number ;;
  }

  dimension: patient_refuse_message_en {
    type: string
    sql: ${TABLE}.patient_refuse_message_en ;;
  }

  dimension: patient_refuse_message_fr_ca {
    type: string
    sql: ${TABLE}.patient_refuse_message_fr_ca ;;
  }

  dimension: is_trial {
    type: string
    sql: ${TABLE}.is_trial ;;
  }

  dimension: patient_confirmation_configuration {
    type: number
    sql: ${TABLE}.patient_confirmation_configuration ;;
  }

  dimension: patient_registration_message_en {
    type: string
    sql: ${TABLE}.patient_registration_message_en ;;
  }

  dimension: patient_registration_message_fr_ca {
    type: string
    sql: ${TABLE}.patient_registration_message_fr_ca ;;
  }

  dimension: unpaid {
    type: string
    sql: ${TABLE}.unpaid ;;
  }

  dimension: payer_account_id {
    type: number
    sql: ${TABLE}.payer_account_id ;;
  }

  dimension: limit_space_usage {
    type: number
    sql: ${TABLE}.limit_space_usage ;;
  }

  dimension: console_type {
    type: number
    sql: ${TABLE}.console_type ;;
  }

  dimension: billing_discount {
    type: number
    sql: ${TABLE}.billing_discount ;;
  }

  dimension: billing_setup_fee {
    type: number
    sql: ${TABLE}.billing_setup_fee ;;
  }

  dimension: health_institution_id {
    type: number
    sql: ${TABLE}.health_institution_id ;;
  }

  dimension: wizard_completed {
    type: string
    sql: ${TABLE}.wizard_completed ;;
  }

  dimension: booking_hub_managed {
    type: string
    sql: ${TABLE}.booking_hub_managed ;;
  }

  set: detail {
    fields: [
      id,
      code,
      acronym,
      name,
      description,
      url,
      created_at_time,
      updated_at_time,
      schedules_enabled,
      absences_due_date,
      next_period_start_date,
      next_period_end_date,
      auto_process,
      parent_group_id,
      absences_public,
      residents_label,
      allow_edit_own_assignments,
      absences_include_holidays,
      locale,
      specialty_id,
      allow_xls_print,
      member_activation_message,
      absences_include_weekends,
      absences_include_oncall,
      inactive,
      key_customer,
      script_creator_id,
      period_count_per_year,
      comment,
      centre_id,
      merge_ampm_as_day,
      show_profile_info,
      invalid_change_request_behavior,
      console_enabled,
      hospital_id,
      location_id,
      timezone_id,
      use_confidential_email,
      absences_restriction_enabled,
      kind_id,
      implementation,
      excluded,
      is_beta_tester,
      premium_customer,
      auto_approve,
      late_threshold_weeks,
      send_activation_email,
      zendesk_id,
      zendesk_in_sync,
      address_line_1,
      address_line_2,
      address_line_3,
      has_mass_import,
      accepts_new_patients,
      patient_dashboard_start_time,
      patient_dashboard_end_time,
      spoken_name_fr_ca,
      spoken_name_en,
      from_phone_number,
      minimum_availability_duration,
      surrogate_subscription_id,
      accepts_anonymous_patients,
      availability_threshold_kind,
      availability_threshold_value,
      family_doctor_label_en,
      family_doctor_label_fr_ca,
      patient_message_with_family_doctor_en,
      patient_message_with_family_doctor_fr_ca,
      patient_message_without_family_doctor_en,
      patient_message_without_family_doctor_fr_ca,
      trial_subscription_id,
      trial_patient_password,
      long_term_reminder_offset,
      short_term_reminder_offset,
      phone_daily_threshold_lower_moment,
      phone_daily_threshold_upper_moment,
      hubspot_id,
      mandatory_fields_before_booking,
      reminder_text_en,
      reminder_text_fr_ca,
      reminder_sms_text_en,
      reminder_sms_text_fr_ca,
      reminder_sms_text_override,
      reminder_phone_text_en,
      reminder_phone_text_fr_ca,
      reminder_phone_text_override,
      validate_hin,
      explicit_sms_from_phone_number,
      patient_refuse_message_en,
      patient_refuse_message_fr_ca,
      is_trial,
      patient_confirmation_configuration,
      patient_registration_message_en,
      patient_registration_message_fr_ca,
      unpaid,
      payer_account_id,
      limit_space_usage,
      console_type,
      billing_discount,
      billing_setup_fee,
      health_institution_id,
      wizard_completed,
      booking_hub_managed
    ]
  }
}
