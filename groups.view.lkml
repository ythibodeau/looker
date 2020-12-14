view: groups {
  sql_table_name: petalmd.groups ;;

  dimension: parent_group_id {
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

  dimension: ramq_external_id {
    type: string
    sql: ${TABLE}.ramq_external_id ;;
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
    label: "acronym"
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
    primary_key: yes
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

  dimension: booking_hub_managed {
    type: yesno
    sql: ${TABLE}.booking_hub_managed ;;
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

  dimension: cohort {
    type: string
    sql: ${health_clusters.cohort} ;;

    html:

    {% if value == "COHORT A" %}
    <p style="color: #67E768; background-color: #008500; font-size:100%; text-align:center;">{{ rendered_value }}</p>
    {% elsif value == "COHORT B" %}
    <p style="color: #FFFF73; background-color: #A6A600; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == "COHORT C" %}
    <p style="color: #FFD073; background-color: #A66F00; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: #FF7373; background-color: #A60000; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
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
    label: "group_name"
    type: string
    sql: ${TABLE}.name ;;
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
      }
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

  dimension: plans {
    type: string
    sql: ${groups_plans.plans} ;;
  }

  dimension: pricing_plan_test {
    type: string
    sql: GROUP_CONCAT(${pricing_plans.name_en}) ;;
  }

  # Indicates if this groups has the Group Scheduling
  dimension: nb_scheduling {
    type: number
    sql: COUNT(${groups_pricing_plans.id} WHERE ${groups_pricing_plans.is_scheduling} = "Yes" ;;
  }

  dimension: is_scheduling {
    type: number
    sql: ${nb_scheduling} > 0 ;;
  }

  dimension: pricing_plan {
    type: string
    sql:
    CASE
      WHEN ${pricing_plans.code} = "basic_sched" THEN "{{ _localization['pricing_plan_basic_sched'] }}"
      WHEN ${pricing_plans.code} = "standard_sched" THEN "{{ _localization['pricing_plan_standard_sched'] }}"
      WHEN ${pricing_plans.code} = "advanced_sched" THEN "{{ _localization['pricing_plan_advanced_sched'] }}"
      WHEN ${pricing_plans.code} = "message_basic" THEN "{{ _localization['pricing_plan_basic_messaging'] }}"
      WHEN ${pricing_plans.code} = "message_standard" THEN "{{ _localization['pricing_plan_standard_messaging'] }}"
      WHEN ${pricing_plans.code} ="hopital_basic_scheduling" THEN "{{ _localization['pricing_plan_hospital_basic'] }}"
      WHEN ${pricing_plans.code} = "hospital_standard" THEN "{{ _localization['pricing_plan_hospital_standard'] }}"
      WHEN ${pricing_plans.code} = "hospital_advanced" THEN "{{ _localization['pricing_plan_hospital_advanced'] }}"
      WHEN ${pricing_plans.code} = "advanced_hospital" THEN "{{ _localization['pricing_plan_hospital_advanced'] }}"
    ELSE
      ${pricing_plans.name_en}
    END ;;
  }

  ### HUB DIMENSIONS ###
  dimension: is_hub_created {
    type: yesno
    sql: ${booking_hub_managed} = 1 AND ${kind_id} = 4 AND ${implementation} = 1 ;;
  }

  dimension: is_hub_ready {
    type: yesno
    sql: ${booking_hub_managed} = 1 AND ${kind_id} = 4 AND ${implementation} = 0 ;;
  }

  dimension: is_emr_connected {
    type: yesno
    sql: ${pati__providers.group_id} IS NOT NULL ;;
  }

  dimension: has_members {
    type: yesno
    sql: ${memberships.group_id} IS NOT NULL ;;
  }

  dimension: has_offerings {
    type: yesno
    sql: ${pati__offerings.group_id} IS NOT NULL ;;
  }

   ### HUB DIMENSIONS ###

  measure: pricing_plans {
    label: "group_pricing_plans"
    type: list
    list_field: pricing_plan
  }

  dimension: is_in_console {
    type: yesno
    sql: ${id} IN (SELECT id from ${groups_in_console.SQL_TABLE_NAME}) ;;
  }

  measure: count {
    type: count
    sql: ${x_groups.id} ;;
    drill_fields: [detail*]
  }

  measure: count_members {
    type: count_distinct
    sql: ${memberships.id} ;;
  }

  measure: count_scheduling {
    label: "count_scheduling"
    type: count_distinct
    sql: ${x_groups.id} ;;
    drill_fields: [detail*]
    filters: [kind_id: "1"]
  }

  measure: count_console_groups {
    label: "count_console_groups"
    type: count_distinct
    sql: ${x_groups.id} ;;
    drill_fields: [detail*]
    filters: [console_enabled: "yes"]
  }

  measure: count_communication_groups {
    label: "count_communication_groups"
    type: count_distinct
    sql: ${x_groups.id} ;;
    drill_fields: [detail*]
    filters: [kind_id: "5"]
  }

  measure: count_implementation {
    label: "count_implementation_groups"
    type: count_distinct
    sql: ${x_groups.id} ;;
    drill_fields: [detail*]
    filters: [implementation: "yes"]
  }

  measure: members_activity_rate {
    type: number
    sql: accounts.last_active_30_days/(accounts.last_active_30_days + accounts.count_not_active_30_days) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      health_institutions.short_name,
      pricing_plans,
      memberships.count
    ]
  }
}
