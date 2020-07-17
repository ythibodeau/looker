view: memberships {
  sql_table_name: petalmd.memberships ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: absences_view_dashboard {
    type: yesno
    sql: ${TABLE}.absences_view_dashboard ;;
  }

  dimension: access_booking_analytics {
    type: yesno
    sql: ${TABLE}.access_booking_analytics ;;
  }

  dimension: access_console_configuration {
    type: yesno
    sql: ${TABLE}.access_console_configuration ;;
  }

  dimension: access_documents {
    type: yesno
    sql: ${TABLE}.access_documents ;;
  }

  dimension: access_hospital_analytics {
    type: yesno
    sql: ${TABLE}.access_hospital_analytics ;;
  }

  dimension: access_phone_registry {
    type: yesno
    sql: ${TABLE}.access_phone_registry ;;
  }

  dimension: access_planner_list {
    type: yesno
    sql: ${TABLE}.access_planner_list ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: activated {
    type: yesno
    sql: ${TABLE}.activated ;;
  }

  dimension_group: activated {
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
    sql: ${TABLE}.activated_at ;;
  }

  dimension: approve_transfers {
    type: yesno
    sql: ${TABLE}.approve_transfers ;;
  }

  dimension_group: availability_sync_ended {
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
    sql: ${TABLE}.availability_sync_ended_at ;;
  }

  dimension_group: availability_sync_started {
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
    sql: ${TABLE}.availability_sync_started_at ;;
  }

  dimension: background_color {
    type: string
    sql: ${TABLE}.background_color ;;
  }

  dimension: cancel_transfers {
    type: yesno
    sql: ${TABLE}.cancel_transfers ;;
  }

  dimension: console_edit_assignments {
    type: yesno
    sql: ${TABLE}.console_edit_assignments ;;
  }

  dimension: create_periods {
    type: yesno
    sql: ${TABLE}.create_periods ;;
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

  dimension: delete_patient_availabilities {
    type: yesno
    sql: ${TABLE}.delete_patient_availabilities ;;
  }

  dimension: disable_patient {
    type: yesno
    sql: ${TABLE}.disable_patient ;;
  }

  dimension: edit_assignments {
    type: yesno
    sql: ${TABLE}.edit_assignments ;;
  }

  dimension: edit_teaching_links {
    type: yesno
    sql: ${TABLE}.edit_teaching_links ;;
  }

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: external_billing_link {
    type: string
    sql: ${TABLE}.external_billing_link ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: hospital_booking_external_access {
    type: yesno
    sql: ${TABLE}.hospital_booking_external_access ;;
  }

  dimension: hospital_booking_manage_templates {
    type: yesno
    sql: ${TABLE}.hospital_booking_manage_templates ;;
  }

  dimension: hospital_booking_see_logs {
    type: yesno
    sql: ${TABLE}.hospital_booking_see_logs ;;
  }

  dimension: hospital_booking_see_stats {
    type: yesno
    sql: ${TABLE}.hospital_booking_see_stats ;;
  }

  dimension: hospital_booking_show_templates {
    type: yesno
    sql: ${TABLE}.hospital_booking_show_templates ;;
  }

  dimension: hospital_booking_test_templates {
    type: yesno
    sql: ${TABLE}.hospital_booking_test_templates ;;
  }

  dimension: initiate_any_transfers {
    type: yesno
    sql: ${TABLE}.initiate_any_transfers ;;
  }

  dimension: initiate_convocations {
    type: yesno
    sql: ${TABLE}.initiate_convocations ;;
  }

  dimension_group: invited {
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
    sql: ${TABLE}.invited_at ;;
  }

  dimension: invited_by_id {
    type: number
    sql: ${TABLE}.invited_by_id ;;
  }

  dimension: is_material_resource {
    type: yesno
    sql: ${TABLE}.is_material_resource ;;
  }

  dimension: is_scheduled {
    type: yesno
    sql: ${TABLE}.is_scheduled ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: manage_absences {
    type: yesno
    sql: ${TABLE}.manage_absences ;;
  }

  dimension: manage_clinic {
    type: yesno
    sql: ${TABLE}.manage_clinic ;;
  }

  dimension: manage_dossiers {
    type: yesno
    sql: ${TABLE}.manage_dossiers ;;
  }

  dimension: manage_memberships {
    type: yesno
    sql: ${TABLE}.manage_memberships ;;
  }

  dimension: manage_phone_registry {
    type: yesno
    sql: ${TABLE}.manage_phone_registry ;;
  }

  dimension: manage_recall_lists {
    type: yesno
    sql: ${TABLE}.manage_recall_lists ;;
  }

  dimension: manage_schedules {
    type: yesno
    sql: ${TABLE}.manage_schedules ;;
    html:
     {% if value == "Yes" %}
       <p style="color: #ffffff; background-color: #592EC2; font-size:100%; text-align:center;">{{ rendered_value }}</p>
     {% else %}
    <p style="text-align:center;">{{ rendered_value }}</p>
     {% endif %}
    ;;
  }

  dimension: messaging_dashboard {
    type: yesno
    sql: ${TABLE}.messaging_dashboard ;;
  }

  dimension: patient_scheduling {
    type: yesno
    sql: ${TABLE}.patient_scheduling ;;
  }

  dimension: post_as_group {
    type: yesno
    sql: ${TABLE}.post_as_group ;;
  }

  dimension: process_transfers {
    type: yesno
    sql: ${TABLE}.process_transfers ;;
  }

  dimension: receive_contact_method_changes {
    type: yesno
    sql: ${TABLE}.receive_contact_method_changes ;;
  }

  dimension: receive_transfer_notifications {
    type: yesno
    sql: ${TABLE}.receive_transfer_notifications ;;
  }

  dimension: second_external_id {
    type: string
    sql: ${TABLE}.second_external_id ;;
  }

  dimension: setting_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.setting_id ;;
  }

  dimension: show_dashboard {
    type: yesno
    sql: ${TABLE}.show_dashboard ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
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

  dimension: view_schedules {
    type: yesno
    sql: ${TABLE}.view_schedules ;;
  }

  dimension: pricing_plan_weight {
    type: string
    sql:
    CASE
      WHEN ${pricing_plans.code} LIKE "%advance%" THEN 3
      WHEN ${pricing_plans.code} LIKE "%standard%" THEN 2
      WHEN ${pricing_plans.code} LIKE "%basic%"THEN 1
      ELSE 0

    END

     ;;
  }

  dimension: mau {
    type: yesno
    sql: TIMESTAMPDIFF(DAY,account_last_active, now()) <= 30 ;;
  }

  dimension: explicit_role {
    label: "memberships.explicit_role"
    type: string
    sql: CASE
            WHEN ${access_documents} = 1 AND
                ${manage_dossiers} = 1 AND
                ${access_phone_registry} = 1 AND
                ${manage_phone_registry} = 1 AND
                ${access_planner_list} = 1 AND
                ${console_edit_assignments} = 1 AND
                ${access_hospital_analytics} = 1 AND
                ${manage_memberships} = 1 AND
                ${manage_phone_registry}
               THEN "{{_localization['roles.console_administrator']}}"
            WHEN ${access_documents} = 1 AND
                ${manage_dossiers} = 1 AND
                ${access_phone_registry} = 1 AND
                ${manage_phone_registry} = 1 AND
                ${access_planner_list} = 1 AND
                ${console_edit_assignments} = 1
               THEN "{{_localization['roles.chief_telephonist']}}"
            WHEN ${access_documents} = 1 AND
                 ${manage_dossiers} = 1 AND
                 ${edit_assignments} = 1 AND
                ${initiate_any_transfers} = 1 AND
                ${manage_absences} = 1 AND
                ${manage_memberships} = 1 AND
                ${manage_schedules} = 1 AND
                ${create_periods} = 1
              THEN "{{_localization['roles.planner']}}"
            WHEN ${access_documents} = 1 AND
                 ${manage_dossiers} = 1 AND
                 ${edit_assignments} = 1 AND
                ${initiate_any_transfers} = 1 AND
                ${edit_teaching_links} = 1
               THEN "{{_localization['roles.post_publication_manager']}}"
            WHEN ${access_documents} = 1
            THEN "{{_localization['roles.regular']}}"
          ELSE "{{_localization['roles.undefined']}}"
         END;;
  }

  measure: count {
    label: "membership_count"
    type: count
    drill_fields: [detail*]
  }

  measure: mau_count {
    type: count
    filters: {
      field: mau
      value: "Yes"
    }
  }

  measure: number_of_unique_accounts {
    type: count_distinct
    sql: ${account_id} ;;
  }

  measure: activated_count {
    type: count
    filters: {
      field: activated
      value: "Yes"
    }
  }

  measure: is_scheduled_count {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: is_scheduled
      value: "Yes"
    }
  }

  measure: not_scheduled_count {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: is_scheduled
      value: "No"
    }
  }

  measure: read_write_count {
    type: count
    sql: ${id} ;;
    filters: {
      field: edit_assignments
      value: "Yes"
    }
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      accounts.first_name,
      accounts.last_name,
      membership_kinds.readable_mnemonic,
      explicit_role,
      groups.name,
    ]
  }
}
