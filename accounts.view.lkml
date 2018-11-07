view: accounts {
  sql_table_name: petalmd_development.accounts ;;

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
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
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

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      username,
      first_name,
      middle_name,
      last_name,
      timezones.id,
      absences.count,
      absence_limits.count,
      accounts_subspecialties.count,
      account_console_groups.count,
      account_distribution_lists.count,
      account_group_paying_links.count,
      account_locations.count,
      assistant_notes.count,
      authentication_tokens.count,
      comments.count,
      community_likes.count,
      comm__documents.count,
      comm__dossiers.count,
      comm__links.count,
      contact_method_histories.count,
      dashboard_calls.count,
      discussions.count,
      folders.count,
      ics_subscriptions.count,
      licenses.count,
      meeting_attendees.count,
      meeting_events.count,
      memberships.count,
      membership_changes.count,
      mess__conversations.count,
      mess__conversers.count,
      mess__message_mentions.count,
      mobile_devices.count,
      notifications.count,
      notification_filters.count,
      notification_preferences.count,
      participants.count,
      pati__account_tasks.count,
      pati__periods.count,
      pati__recall_list_accounts.count,
      pati__subscriptions.count,
      pati__subscriptions_authorized_accounts.count,
      pati__templates.count,
      profiles.count,
      schedule_events.count,
      _absence_changes.count,
      _period_report_options.count,
      _resources.count,
      _transfer_notifications.count,
      shared_distribution_lists.count,
      simple__resources.count,
      trackings.count,
      trials.count,
      validation_tokens.count
    ]
  }
}
