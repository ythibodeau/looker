view: accounts {
  sql_table_name: petalmd.accounts ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: accepted {
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
    sql: ${TABLE}.accepted_at ;;
  }

  dimension: accepted_from {
    type: string
    sql: ${TABLE}.accepted_from ;;
  }

  dimension: account_status_id {
    type: number
    sql: ${TABLE}.account_status_id ;;
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

  dimension: activation_code {
    type: string
    sql: ${TABLE}.activation_code ;;
  }

  dimension: activation_email_bounce_description {
    type: string
    sql: ${TABLE}.activation_email_bounce_description ;;
  }

  dimension: activation_email_diagnostic {
    type: string
    sql: ${TABLE}.activation_email_diagnostic ;;
  }

  dimension: activation_email_id {
    type: string
    sql: ${TABLE}.activation_email_id ;;
  }

  dimension: activation_email_status {
    type: string
    sql: ${TABLE}.activation_email_status ;;
  }

  dimension: activation_email_timestamp {
    type: number
    sql: ${TABLE}.activation_email_timestamp ;;
  }

  dimension: allow_video_call {
    type: yesno
    sql: ${TABLE}.allow_video_call ;;
  }

  dimension: api_key {
    type: string
    sql: ${TABLE}.api_key ;;
  }

  dimension: chargebee_customer_id {
    type: string
    sql: ${TABLE}.chargebee_customer_id ;;
  }

  dimension: community_welcome_closed {
    type: yesno
    sql: ${TABLE}.community_welcome_closed ;;
  }

  dimension_group: confirmed {
    label: "confirmed_date"
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
    sql: ${TABLE}.confirmed_at ;;
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

  dimension: crypted_password {
    type: string
    sql: ${TABLE}.crypted_password ;;
  }

  dimension: cut_multiday {
    type: yesno
    sql: ${TABLE}.cut_multiday ;;
  }

  dimension_group: deactivated {
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
    sql: ${TABLE}.deactivated_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_confirmation_code {
    type: string
    sql: ${TABLE}.email_confirmation_code ;;
  }

  dimension: favorite_group_id {
    type: number
    sql: ${TABLE}.favorite_group_id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  #TODO: Vitalité Hack- À supprimer
  dimension: vitalite_name {
    type: string
    sql: CASE WHEN ${kind_id} = 1 THEN CONCAT("Docteur ", ${first_name}, " ", ${last_name}) ELSE CONCAT(${first_name}, " ", ${last_name}) END ;;
  }

  dimension_group: forgot_password {
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
    sql: ${TABLE}.forgot_password_at ;;
  }

  dimension: forgot_password_code {
    type: string
    sql: ${TABLE}.forgot_password_code ;;
  }

  dimension: hubspot_id {
    type: string
    sql: ${TABLE}.hubspot_id ;;
  }

  dimension: in_training {
    type: yesno
    sql: ${TABLE}.in_training ;;
  }

  dimension: initial_trial_kind {
    type: number
    sql: ${TABLE}.initial_trial_kind ;;
  }

  dimension: invited_by_id {
    type: number
    sql: ${TABLE}.invited_by_id ;;
  }

  dimension: is_beta_tester {
    type: yesno
    sql: ${TABLE}.is_beta_tester ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension_group: last_activated {
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
    sql: ${TABLE}.last_activated_at ;;
  }

  dimension_group: last_active {
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
    sql: ${TABLE}.last_active_on ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
    html: <span title="This is a test {{accounts.cumulative_confirmed._value}}">{{rendered_value}}</span>;;
  }

  dimension: full_name {
    type: string
    sql: CONCAT(${first_name}, " ", ${last_name}) ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: locale_fr {
    type: string
    sql: CASE WHEN ${TABLE}.locale = "fr_CA" THEN "Français" ELSE "Anglais" END ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: opted_in_scoville {
    type: yesno
    sql: ${TABLE}.opted_in_scoville ;;
  }

  dimension_group: password_updated {
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
    sql: ${TABLE}.password_updated_at ;;
  }

  dimension_group: pending_invite {
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
    sql: ${TABLE}.pending_invite_at ;;
  }

  dimension: policy_version {
    type: string
    sql: ${TABLE}.policy_version ;;
  }

  dimension: remote_token {
    type: string
    sql: ${TABLE}.remote_token ;;
  }

  dimension: salt {
    type: string
    sql: ${TABLE}.salt ;;
  }

  dimension: share_schedule_events {
    type: yesno
    sql: ${TABLE}.share_schedule_events ;;
  }

  dimension: specialty_id {
    type: number
    sql: ${TABLE}.specialty_id ;;
  }

  dimension: start_day_sunday {
    type: yesno
    sql: ${TABLE}.start_day_sunday ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
    html:

    {% if value == "created" %}
      <p style="color: #ffffff; background-color: #B32F37; font-size:100%; text-align:center;">{{ rendered_value }}</p>
    {% elsif value == "confirmed" %}
      <p style="color: #ffffff; background-color: #72D16D; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == "deactivated" %}
     <p style="color: #ffffff; background-color: gray; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == "pending_invite" %}
     <p style="color: #ffffff; background-color: #F99245; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="color: #ffffff; background-color: #FFD95F; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  dimension: state_ordered {
    type: string
    sql:
      CASE
      WHEN ${TABLE}.state = "created" THEN "1-created"
      WHEN ${TABLE}.state = "pending_invite" THEN "2-pending_invite"
      WHEN ${TABLE}.state = "activated" THEN "3-activated"
      WHEN ${TABLE}.state = "confirmed" THEN "4-confirmed"
      WHEN ${TABLE}.state = "deactivated" THEN "5-deactivated"
    END
     ;;
    html:

    {% if value == "1-created" %}
      <p style="color: #ffffff; background-color: #B32F37; font-size:100%; text-align:center;">{{ rendered_value }}</p>
    {% elsif value == "4-confirmed" %}
      <p style="color: #ffffff; background-color: #72D16D; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == "5-deactivated" %}
     <p style="color: #ffffff; background-color: gray; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == "2-pending_invite" %}
     <p style="color: #ffffff; background-color: #F99245; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="color: #ffffff; background-color: #FFD95F; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  dimension: state_nice {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.state = "created" THEN "Compté Créé"
      WHEN ${TABLE}.state = "pending_invite" THEN "Courriel d'activation non-reçu"
      WHEN ${TABLE}.state = "activated" THEN "Courriel d'activation reçu"
      WHEN ${TABLE}.state = "confirmed" THEN "Activé"
      WHEN ${TABLE}.state = "deactivated" THEN "Désactivé"
    END

    ;;
  }

  dimension: stripe_id {
    type: string
    sql: ${TABLE}.stripe_id ;;
  }

  dimension: timezone_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.timezone_id ;;
  }

  dimension: unconfirmed_email {
    type: string
    sql: ${TABLE}.unconfirmed_email ;;
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

  dimension: user_agreement {
    type: string
    sql: ${TABLE}.user_agreement ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension_group: verified {
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
    sql: ${TABLE}.verified_at ;;
  }

  dimension: zendesk_id {
    type: number
    sql: ${TABLE}.zendesk_id ;;
  }

  dimension: zendesk_in_sync {
    type: yesno
    sql: ${TABLE}.zendesk_in_sync ;;
  }

  dimension: last_active_30_days {
    type: yesno
    sql: ${last_active_date} BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()  ;;
  }

  dimension_group: first_comment {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${account_first_comment.first_comment} ;;
  }

  dimension_group: last_comment {
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: MAX(${comments.created_raw}) ;;
  }

  dimension: highest_paying_plan {
    type: number
    sql: MAX(${memberships.pricing_plan_weight})
     ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
    label: "accounts"
  }

  measure: count_unique {
    type: count_distinct
    sql: ${accounts.id} ;;
    label: "accounts"
  }

  measure: confirmed_count {
    label: "Confirmed Count"
    type: count
    filters: {
      field: state
      value: "confirmed"
    }
  }

  measure: count_unique_confirmed {
    type: count_distinct
    filters: {
      field: state
      value: "confirmed"
    }
    sql: ${id} ;;
  }

  parameter: date_filter {
    type: date
  }

  measure: count_unique_confirmed_test {
    type: count_distinct
    filters: {
      field: state
      value: "confirmed"
    }
    sql: CASE WHEN ${confirmed_date} >= {% parameter date_filter %} THEN ${id} END ;;
  }

  measure: activated_count {
    label: "Activated Count"
    type: count
    filters: {
      field: state
      value: "activated"
    }
  }

  measure: deactivated_count {
    label: "deactivated_count"
    type: count
    filters: {
      field: state
      value: "deactivated"
    }
    drill_fields: [accounts.id, accounts.first_name, accounts.last_name, accounts.simplified_kind, accounts.deactivated_at]
  }

  measure: deactivated_and_previously_confirmed_count {
    label: "Deactivated and previously confirmed Count"
    type: count
    filters: {
      field: state
      value: "deactivated"
    }
    filters: {
      field: confirmed_date
      value: "NOT NULL"
    }
  }

  measure: count_unique_activated {
    type: count_distinct
    filters: {
      field: state
      value: "activated"
    }
    sql: ${id} ;;
  }

  measure: count_unique_created {
    type: count_distinct
    filters: {
      field: state
      value: "created"
    }
    sql: ${id} ;;
  }

  measure: count_unique_pending_invite {
    label: "count_unique_pending_invite"
    type: count_distinct
    filters: {
      field: state
      value: "pending_invite"
    }
    sql: ${id} ;;
    drill_fields: [accounts.id, accounts.first_name, accounts.last_name, accounts.simplified_kind, accounts.activation_email_status, accounts.activation_email_bounce_description, accounts.groups_acronym]
  }

  measure: count_no_email {
    label: "accounts_without_email"
    type: count_distinct
    sql: ${id} ;;
    filters: [email: "%@prod.petaltest.com"]
    drill_fields: [detail*]
  }

  measure: count_last_active_30_days {
    type: count
    filters: {
      field: last_active_30_days
      value: "Yes"
    }
  }

  measure: cumulative_confirmed {
    type: running_total
    sql: ${state} = "confirmed" ;;
  }

  dimension: days_since_user_signup {
    hidden: yes
    type: number
    sql: DATEDIFF(now(), ${confirmed_date});;
  }

  dimension: months_since_user_signup {
    type: number
    sql: FLOOR(${days_since_user_signup}/(30)) ;;
  }

  dimension: months_since_user_signup_tier {
    type: tier
    tiers: [1,3,6,12,24]
    style: integer
    sql: ${months_since_user_signup} ;;
  }

  dimension: is_scheduled {
    type: yesno
    sql: EXISTS(SELECT ${memberships.id} FROM ${memberships.SQL_TABLE_NAME})
    WHERE ${accounts.id} = ${memberships.account_id} AND ${memberships.is_scheduled} = 1);;
  }

  dimension: simplified_kind {
    label: "simplified_kind"
    type: string
    sql: CASE
          WHEN ${kind_id} IN (1,14,17) THEN "{{ _localization['doctor'] }}"
          WHEN ${kind_id} = 3 THEN "{{ _localization['extern'] }}"
          WHEN ${kind_id} IN (2, 9, 11, 12, 13, 15, 16) THEN "{{ _localization['resident'] }}"
          WHEN ${kind_id} = 7  THEN "{{ _localization['other_health_professional'] }}"
          WHEN ${kind_id} = 5 THEN "{{ _localization['assistant'] }}"
          WHEN ${kind_id} = 6 THEN "{{ _localization['administrator'] }}"
          WHEN ${kind_id} = 23 THEN "{{ _localization['dentist'] }}"
          WHEN ${kind_id} = 29 THEN "{{ _localization['pharmacist'] }}"
          WHEN ${kind_id} = 32 THEN "{{ _localization['pharmarcy_technician'] }}"
          WHEN ${kind_id} = 8 THEN "{{ _localization['generic_doctor'] }}"
          WHEN ${kind_id} = 10 THEN "{{ _localization['generic_assistant'] }}"
          WHEN ${kind_id} = 19 THEN "Undefined"
          WHEN ${kind_id} = 20 THEN "{{ _localization['other'] }}"
          WHEN ${kind_id} = 26 THEN "{{ _localization['maccs'] }}"
          WHEN ${kind_id} = 35 THEN "{{ _localization['social_worker'] }}"
          WHEN ${kind_id} = 38 THEN "{{ _localization['psychologist'] }}"
          WHEN ${kind_id} = 41 THEN "{{ _localization['physiotherapist'] }}"
          WHEN ${kind_id} = 44 THEN "{{ _localization['medical_physicist'] }}"
          WHEN ${kind_id} = 53 THEN "{{ _localization['veterinarian'] }}"
          WHEN ${kind_id} = 56 THEN "{{ _localization['engineer'] }}"
          WHEN ${kind_id} = 47 THEN "{{ _localization['technologist'] }}"
          WHEN ${kind_id} = 4 THEN "{{ _localization['nurse_practitioner'] }}"
          ELSE "Other"
          END ;;
  }

  dimension: is_gp {
    type: yesno
    sql: ${TABLE}.kind_id = 1 AND ${TABLE}.specialty_id = 10 ;;
  }

  dimension: is_specialist {
    type: yesno
    sql: ${TABLE}.kind_id = 1 AND ${TABLE}.specialty_id <> 10 ;;
  }

  dimension: group_acronym {
    type: string
    sql: ${groups.acronym} ;;
  }

  measure: groups_acronym {
    type: list
    list_field: group_acronym
  }

  dimension: console_group_acronym {
    type: string
    sql: ${console_groups.acronym} ;;
  }

  measure: console_group_acronyms {
    type: list
    list_field: console_group_acronym
  }

  dimension: access_group_acronym {
    type: string
    sql: ${access_groups.acronym} ;;
  }

  measure: access_group_acronyms {
    type: list
    list_field: access_group_acronym
  }

  measure: memberships_count {
    type: count
    sql: ${memberships.count} ;;
  }

  measure: count_doctors_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Doctor"
    }
  }

  measure: count_confirmed_doctors_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Doctor"
    }
    filters: {
      field: state
      value: "confirmed"
    }
  }

  measure: count_residents_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Resident"
    }
  }

  measure: count_confirmed_residents_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Resident"
    }
    filters: {
      field: state
      value: "confirmed"
    }
  }

  measure: count_assistants_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Assistant"
    }
  }

  measure: count_confirmed_assistants_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Assistant"
    }
    filters: {
      field: state
      value: "confirmed"
    }
  }

  measure: count_hcps_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Other Healthcare Professional"
    }
  }

  measure: count_confirmed_hcps_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Other Healthcare Professional"
    }
    filters: {
      field: state
      value: "confirmed"
    }
  }

  measure: count_others_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Other"
    }
  }

  measure: count_confirmed_others_only {
    type: count
    filters: {
      field: simplified_kind
      value: "Other"
    }
    filters: {
      field: state
      value: "confirmed"
    }
  }

  measure: scheduled_count {
    type: count
    filters: {
      field: is_scheduled
      value: "Yes"
    }

    drill_fields: [accounts.id, accounts.first_name, accounts.last_name, accounts.simplified_kind, accounts.console_group_acronyms, comments.count_is_last_30_days]
  }


  measure: not_scheduled_count {
    type: count
    filters: {
      field: is_scheduled
      value: "No"
    }
  }

  dimension: at_least_one_group {
    type: yesno
    sql: ${account_group_counts.total_groups} > 0 ;;
  }

  measure: at_least_one_group_count {
    type: count
    filters: {
      field: at_least_one_group
      value: "Yes"
    }
    filters: {
      field: state
      value: "confirmed"
    }
  }

  dimension: at_least_one_group_non_asso {
    type: yesno
    sql: ${account_group_counts.total_non_asso_groups} > 0 ;;
  }

  measure: at_least_one_group_non_asso_count {
    type: count
    filters: {
      field: at_least_one_group_non_asso
      value: "Yes"
    }
    filters: {
      field: state
      value: "confirmed"
    }
  }

  measure: count_confirmed_at_least_one_group {
    type: count
    filters: {
      field: state
      value: "confirmed"
    }
    filters: {
      field: at_least_one_group
      value: "Yes"
    }
  }

  #### CUSTOMER SCORE DATA ######
  dimension: is_schedulable_account {
    type: yesno
    sql: ${kind_id} IN (1,14,17,2,9,11,12,13,15,16,7) ;;
  }

  measure: scheduled_accounts {
    type: count
    filters: {
      field: is_schedulable_account
      value: "Yes"
    }
  }

  measure: scheduled_accounts_confirmed {
    type: count
    filters: {
      field: is_schedulable_account
      value: "Yes"
    }
    filters: {
      field: state
      value: "confirmed"
    }
  }

  measure: scheduled_accounts_active_l30days {
    type: count
    filters: {
      field: is_schedulable_account
      value: "Yes"
    }
    filters: {
      field: last_active_30_days
      value: "Yes"
    }
  }

  measure: unscheduled_accounts {
    type: count
    filters: {
      field: is_schedulable_account
      value: "No"
    }
  }

  measure: unscheduled_accounts_confirmed {
    type: count
    filters: {
      field: is_schedulable_account
      value: "No"
    }
    filters: {
      field: state
      value: "confirmed"
    }
  }

  measure: unscheduled_accounts_active_l30days {
    type: count
    filters: {
      field: is_schedulable_account
      value: "No"
    }
    filters: {
      field: last_active_30_days
      value: "Yes"
    }
  }

  #### CUSTOMER SCORE DATA ######


  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      middle_name,
      last_name,
      state,
      last_active_date,
      simplified_kind,
      groups_acronym
    ]
  }
}
