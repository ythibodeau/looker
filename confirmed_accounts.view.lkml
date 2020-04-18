view: confirmed_accounts {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT * from accounts where state IN ('confirmed', 'deactivated')
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

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: crypted_password {
    type: string
    sql: ${TABLE}.crypted_password ;;
  }

  dimension: salt {
    type: string
    sql: ${TABLE}.salt ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: middle_name {
    type: string
    sql: ${TABLE}.middle_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: remote_token {
    type: string
    sql: ${TABLE}.remote_token ;;
  }

  dimension: api_key {
    type: string
    sql: ${TABLE}.api_key ;;
  }

  dimension: forgot_password_code {
    type: string
    sql: ${TABLE}.forgot_password_code ;;
  }

  dimension: specialty_id {
    type: number
    sql: ${TABLE}.specialty_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension_group: last_activated_at {
    type: time
    sql: ${TABLE}.last_activated_at ;;
  }

  dimension: start_day_sunday {
    type: string
    sql: ${TABLE}.start_day_sunday ;;
  }

  dimension: user_agreement {
    type: string
    sql: ${TABLE}.user_agreement ;;
  }

  dimension_group: accepted_at {
    type: time
    sql: ${TABLE}.accepted_at ;;
  }

  dimension: accepted_from {
    type: string
    sql: ${TABLE}.accepted_from ;;
  }

  dimension: cut_multiday {
    type: string
    sql: ${TABLE}.cut_multiday ;;
  }

  dimension_group: activated_at {
    type: time
    sql: ${TABLE}.activated_at ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: activation_code {
    type: string
    sql: ${TABLE}.activation_code ;;
  }

  dimension_group: confirmed_at {
    type: time
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension_group: deactivated_at {
    type: time
    sql: ${TABLE}.deactivated_at ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: share_schedule_events {
    type: string
    sql: ${TABLE}.share_schedule_events ;;
  }

  dimension: favorite_group_id {
    type: number
    sql: ${TABLE}.favorite_group_id ;;
  }

  dimension: timezone_id {
    type: number
    sql: ${TABLE}.timezone_id ;;
  }

  dimension: last_active_on {
    type: date
    sql: ${TABLE}.last_active_on ;;
  }

  dimension: activation_email_id {
    type: string
    sql: ${TABLE}.activation_email_id ;;
  }

  dimension: activation_email_status {
    type: string
    sql: ${TABLE}.activation_email_status ;;
  }

  dimension: activation_email_bounce_description {
    type: string
    sql: ${TABLE}.activation_email_bounce_description ;;
  }

  dimension: activation_email_diagnostic {
    type: string
    sql: ${TABLE}.activation_email_diagnostic ;;
  }

  dimension_group: pending_invite_at {
    type: time
    sql: ${TABLE}.pending_invite_at ;;
  }

  dimension: is_beta_tester {
    type: string
    sql: ${TABLE}.is_beta_tester ;;
  }

  dimension: activation_email_timestamp {
    type: number
    sql: ${TABLE}.activation_email_timestamp ;;
  }

  dimension: account_status {
    type: number
    sql: ${TABLE}.account_status ;;
  }

  dimension: in_training {
    type: string
    sql: ${TABLE}.in_training ;;
  }

  dimension: invited_by_id {
    type: number
    sql: ${TABLE}.invited_by_id ;;
  }

  dimension: opted_in_scoville {
    type: string
    sql: ${TABLE}.opted_in_scoville ;;
  }

  dimension: zendesk_id {
    type: number
    sql: ${TABLE}.zendesk_id ;;
  }

  dimension: zendesk_in_sync {
    type: string
    sql: ${TABLE}.zendesk_in_sync ;;
  }

  dimension_group: password_updated_at {
    type: time
    sql: ${TABLE}.password_updated_at ;;
  }

  dimension: policy_version {
    type: string
    sql: ${TABLE}.policy_version ;;
  }

  dimension_group: forgot_password_at {
    type: time
    sql: ${TABLE}.forgot_password_at ;;
  }

  dimension_group: verified_at {
    type: time
    sql: ${TABLE}.verified_at ;;
  }

  dimension: community_welcome_closed {
    type: string
    sql: ${TABLE}.community_welcome_closed ;;
  }

  dimension: initial_trial_kind {
    type: number
    sql: ${TABLE}.initial_trial_kind ;;
  }

  dimension: hubspot_id {
    type: string
    sql: ${TABLE}.hubspot_id ;;
  }

  dimension: unconfirmed_email {
    type: string
    sql: ${TABLE}.unconfirmed_email ;;
  }

  dimension: email_confirmation_code {
    type: string
    sql: ${TABLE}.email_confirmation_code ;;
  }

  dimension: stripe_id {
    type: string
    sql: ${TABLE}.stripe_id ;;
  }

  dimension: allow_video_call {
    type: string
    sql: ${TABLE}.allow_video_call ;;
  }

  dimension: chargebee_customer_id {
    type: string
    sql: ${TABLE}.chargebee_customer_id ;;
  }

  set: detail {
    fields: [
      id,
      username,
      email,
      crypted_password,
      salt,
      first_name,
      middle_name,
      last_name,
      locale,
      remote_token,
      api_key,
      forgot_password_code,
      specialty_id,
      created_at_time,
      updated_at_time,
      last_activated_at_time,
      start_day_sunday,
      user_agreement,
      accepted_at_time,
      accepted_from,
      cut_multiday,
      activated_at_time,
      state,
      activation_code,
      confirmed_at_time,
      deactivated_at_time,
      kind_id,
      share_schedule_events,
      favorite_group_id,
      timezone_id,
      last_active_on,
      activation_email_id,
      activation_email_status,
      activation_email_bounce_description,
      activation_email_diagnostic,
      pending_invite_at_time,
      is_beta_tester,
      activation_email_timestamp,
      account_status,
      in_training,
      invited_by_id,
      opted_in_scoville,
      zendesk_id,
      zendesk_in_sync,
      password_updated_at_time,
      policy_version,
      forgot_password_at_time,
      verified_at_time,
      community_welcome_closed,
      initial_trial_kind,
      hubspot_id,
      unconfirmed_email,
      email_confirmation_code,
      stripe_id,
      allow_video_call,
      chargebee_customer_id
    ]
  }
}
