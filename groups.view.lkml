view: groups {
  sql_table_name: petalmd.groups ;;

  dimension: parent_group_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.parent_group_id ;;
  }

  dimension_group: absences_due {
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
    sql: ${TABLE}.absences_due_date ;;
  }

  dimension: absences_include_holidays {
    type: yesno
    sql: ${TABLE}.absences_include_holidays ;;
  }

  dimension: absences_include_oncall {
    type: yesno
    sql: ${TABLE}.absences_include_oncall ;;
  }

  dimension: absences_include_weekends {
    type: yesno
    sql: ${TABLE}.absences_include_weekends ;;
  }

  dimension: absences_public {
    type: yesno
    sql: ${TABLE}.absences_public ;;
  }

  dimension: absences_restriction_enabled {
    type: yesno
    sql: ${TABLE}.absences_restriction_enabled ;;
  }

  dimension: accepts_anonymous_patients {
    type: yesno
    sql: ${TABLE}.accepts_anonymous_patients ;;
  }

  dimension: accepts_new_patients {
    type: yesno
    sql: ${TABLE}.accepts_new_patients ;;
  }

  dimension: acronym {
    type: string
    sql: ${TABLE}.acronym ;;
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

  dimension: allow_edit_own_assignments {
    type: yesno
    sql: ${TABLE}.allow_edit_own_assignments ;;
  }

  dimension: allow_xls_print {
    type: yesno
    sql: ${TABLE}.allow_xls_print ;;
  }

  dimension: auto_approve {
    type: yesno
    sql: ${TABLE}.auto_approve ;;
  }

  dimension: auto_process {
    type: yesno
    sql: ${TABLE}.auto_process ;;
  }

  dimension: availability_threshold_kind {
    type: number
    sql: ${TABLE}.availability_threshold_kind ;;
  }

  dimension: availability_threshold_value {
    type: number
    sql: ${TABLE}.availability_threshold_value ;;
  }

  dimension: billing_discount {
    type: number
    sql: ${TABLE}.billing_discount ;;
  }

  dimension_group: billing_first {
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
    sql: ${TABLE}.billing_first_date ;;
  }

  dimension: billing_setup_fee {
    type: number
    sql: ${TABLE}.billing_setup_fee ;;
  }

  dimension: centre_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.centre_id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: console_enabled {
    type: yesno
    sql: ${TABLE}.console_enabled ;;
  }

  dimension: console_type {
    type: number
    sql: ${TABLE}.console_type ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: excluded {
    type: yesno
    sql: ${TABLE}.excluded ;;
  }

  dimension: explicit_sms_from_phone_number {
    type: string
    sql: ${TABLE}.explicit_sms_from_phone_number ;;
  }

  dimension: family_doctor_label_en {
    type: string
    sql: ${TABLE}.family_doctor_label_en ;;
  }

  dimension: family_doctor_label_fr_ca {
    type: string
    sql: ${TABLE}.family_doctor_label_fr_ca ;;
  }

  dimension: from_phone_number {
    type: string
    sql: ${TABLE}.from_phone_number ;;
  }

  dimension: has_mass_import {
    type: yesno
    sql: ${TABLE}.has_mass_import ;;
  }

  dimension: hospital_id {
    type: number
    sql: ${TABLE}.hospital_id ;;
  }

  dimension: hubspot_id {
    type: string
    sql: ${TABLE}.hubspot_id ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: implementation {
    type: yesno
    sql: ${TABLE}.implementation ;;
  }

  dimension: inactive {
    type: yesno
    sql: ${TABLE}.inactive ;;
  }

  dimension: status  {
    type: string
    sql: CASE WHEN ${inactive} = 1 THEN "Inactive" ELSE "Active" END ;;
    html:
    {% if value == "Active" %}
    <p style="color: #ffffff; background-color: #72D16D; font-size:100%; text-align:center;">{{ rendered_value }}</p>
    {% else %}
    <p style="color: #ffffff; background-color: #B32F37; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %}
    ;;
  }

  dimension: invalid_change_request_behavior {
    type: string
    sql: ${TABLE}.invalid_change_request_behavior ;;
  }

  dimension: is_beta_tester {
    type: yesno
    sql: ${TABLE}.is_beta_tester ;;
  }

  dimension: is_trial {
    type: yesno
    sql: ${TABLE}.is_trial ;;
  }

  dimension: key_customer {
    type: yesno
    sql: ${TABLE}.key_customer ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: clean_kind {
    type: string
    sql:
      CASE
        WHEN ${kind_id} = 1 THEN "Department"
        WHEN ${kind_id} = 2 THEN "Hospital"
        WHEN ${kind_id} = 3 THEN "Centre"
        WHEN ${kind_id} = 4 THEN "Association"
        WHEN ${kind_id} = 5 THEN "Communication"
        WHEN ${kind_id} = 6 THEN "Clinic"
        WHEN ${kind_id} = 7 THEN "Integrated Centre"
      END
    ;;
  }

  dimension: chargebe_cohort {
    type: string
    sql: CASE
        WHEN ${id} IN (2738, 751, 450, 226, 1816, 1842, 217, 28, 2, 421, 256, 1858, 2300, 1288, 1024, 300, 267, 385, 608, 1146, 1244, 409, 342, 1232, 312, 2297, 1825) THEN "April 2019"
        ELSE NULL
        END;;
  }

  dimension: late_threshold_weeks {
    type: number
    sql: ${TABLE}.late_threshold_weeks ;;
  }

  dimension: limit_space_usage {
    type: number
    sql: ${TABLE}.limit_space_usage ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: location_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.location_id ;;
  }

  dimension: long_term_reminder_offset {
    type: number
    sql: ${TABLE}.long_term_reminder_offset ;;
  }

  dimension: mandatory_fields_before_booking {
    type: yesno
    sql: ${TABLE}.mandatory_fields_before_booking ;;
  }

  dimension: member_activation_message {
    type: string
    sql: ${TABLE}.member_activation_message ;;
  }

  dimension: merge_ampm_as_day {
    type: yesno
    sql: ${TABLE}.merge_ampm_as_day ;;
  }

  dimension: minimum_availability_duration {
    type: number
    sql: ${TABLE}.minimum_availability_duration ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: next_period_end {
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
    sql: ${TABLE}.next_period_end_date ;;
  }

  #dimension_group: next_period_start {
  #  type: time
  #  timeframes: [
  #    raw,
  #    date,
  #    week,
  #    month,
  #    quarter,
  #    year
  #  ]
  #  convert_tz: no
  #  datatype: date
  #  sql: ${TABLE}.next_period_start_date ;;
  #}

  dimension: current_period {}

  dimension: patient_confirmation_configuration {
    type: number
    sql: ${TABLE}.patient_confirmation_configuration ;;
  }

  dimension: patient_dashboard_end_time {
    type: string
    sql: ${TABLE}.patient_dashboard_end_time ;;
  }

  dimension: patient_dashboard_start_time {
    type: string
    sql: ${TABLE}.patient_dashboard_start_time ;;
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

  dimension: patient_refuse_message_en {
    type: string
    sql: ${TABLE}.patient_refuse_message_en ;;
  }

  dimension: patient_refuse_message_fr_ca {
    type: string
    sql: ${TABLE}.patient_refuse_message_fr_ca ;;
  }

  dimension: patient_registration_message_en {
    type: string
    sql: ${TABLE}.patient_registration_message_en ;;
  }

  dimension: patient_registration_message_fr_ca {
    type: string
    sql: ${TABLE}.patient_registration_message_fr_ca ;;
  }

  dimension: payer_account_id {
    type: number
    sql: ${TABLE}.payer_account_id ;;
  }

  dimension: period_count_per_year {
    type: number
    sql: ${TABLE}.period_count_per_year ;;
  }

  dimension: phone_daily_threshold_lower_moment {
    type: number
    sql: ${TABLE}.phone_daily_threshold_lower_moment ;;
  }

  dimension: phone_daily_threshold_upper_moment {
    type: number
    sql: ${TABLE}.phone_daily_threshold_upper_moment ;;
  }

  dimension: premium_customer {
    type: yesno
    sql: ${TABLE}.premium_customer ;;
  }

  dimension: recurring_billing {
    type: number
    sql: ${TABLE}.recurring_billing ;;
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

  dimension: residents_label {
    type: string
    sql: ${TABLE}.residents_label ;;
  }

  dimension: schedules_enabled {
    type: yesno
    sql: ${TABLE}.schedules_enabled ;;
  }

  dimension: script_creator_id {
    type: number
    sql: ${TABLE}.script_creator_id ;;
  }

  dimension: send_activation_email {
    type: yesno
    sql: ${TABLE}.send_activation_email ;;
  }

  dimension: short_term_reminder_offset {
    type: number
    sql: ${TABLE}.short_term_reminder_offset ;;
  }

  dimension: show_profile_info {
    type: yesno
    sql: ${TABLE}.show_profile_info ;;
  }

  dimension: specialty_id {
    type: number
    sql: ${TABLE}.specialty_id ;;
  }

  dimension: spoken_name_en {
    type: string
    sql: ${TABLE}.spoken_name_en ;;
  }

  dimension: spoken_name_fr_ca {
    type: string
    sql: ${TABLE}.spoken_name_fr_ca ;;
  }

  dimension: surrogate_subscription_id {
    type: number
    sql: ${TABLE}.surrogate_subscription_id ;;
  }

  dimension: timezone_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.timezone_id ;;
  }

  dimension: trial_patient_password {
    type: string
    sql: ${TABLE}.trial_patient_password ;;
  }

  dimension: trial_subscription_id {
    type: number
    sql: ${TABLE}.trial_subscription_id ;;
  }

  dimension: unpaid {
    type: yesno
    sql: ${TABLE}.unpaid ;;
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

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: use_confidential_email {
    type: yesno
    sql: ${TABLE}.use_confidential_email ;;
  }

  dimension: validate_hin {
    type: yesno
    sql: ${TABLE}.validate_hin ;;
  }

  dimension: zendesk_id {
    type: number
    sql: ${TABLE}.zendesk_id ;;
  }

  dimension: zendesk_in_sync {
    type: yesno
    sql: ${TABLE}.zendesk_in_sync ;;
  }

  dimension: last_period_id {
    type: number
    sql: MAX(${sche__periods.id}) ;;
  }

  dimension: health_institution_id {
    type: number
    sql: ${TABLE}.health_institution_id ;;
  }

  dimension: pricing_plan {
    type: string
    sql: ${pricing_plans.name_en} ;;
  }

  measure: pricing_plans {
    type: list
    list_field: pricing_plan
  }

  measure: count {
    type: count
    sql: ${groups.id} ;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      parent_group_id,
      name,
      centres.name,
      centres.parent_centre_id,
      locations.id,
      timezones.id,
      absences.count,
      absence_date_ranges.count,
      absence_notifications.count,
      absence_report_configs.count,
      account_group_paying_links.count,
      admi__account_import_lines.count,
      admi__group_period_details.count,
      admi__trackings.count,
      assistant_notes.count,
      book__notification_template_groups.count,
      book__queued_notifications.count,
      categories.count,
      comm__documents.count,
      comm__dossiers.count,
      comm__links.count,
      discussions.count,
      groups_pricing_plans.count,
      group_absence_slot_kinds.count,
      group_analytics_reports.count,
      group_distribution_lists.count,
      group_export_datas.count,
      holidays.count,
      ip_ranges.count,
      meeting_billing_codes.count,
      meeting_events.count,
      memberships.count,
      membership_changes.count,
      notification_filters.count,
      pati__appointment_check_ins.count,
      pati__availability_query_logs.count,
      pati__display_items.count,
      pati__form_forms.count,
      pati__medical_notes.count,
      pati__offerings.count,
      pati__patient_statuses.count,
      pati__periods.count,
      pati__providers.count,
      pati__provider_changed_items.count,
      pati__reasons.count,
      pati__recall_lists.count,
      pati__requests.count,
      pati__subscriptions.count,
      pati__template_kinds.count,
      pati__waiting_rooms.count,
      restrictions.count,
      schedule_events.count,
      _availability_mappings.count,
      _change_requests.count,
      _console_layouts.count,
      _console_schedule_rows.count,
      _periods.count,
      _sourcings.count,
      _trackings.count,
      simple__schedule_configurations.count,
      trackings.count,
      trials.count,
      weekly_comments.count
    ]
  }
}
