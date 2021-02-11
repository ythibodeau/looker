view: book__queued_notifications {
  sql_table_name: petalmd.book__queued_notifications ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: acknowledged_by_third_party {
    type: yesno
    sql: ${TABLE}.acknowledged_by_third_party ;;
  }

  dimension: action {
    type: number
    sql: ${TABLE}.action ;;
  }

  dimension: api_payload {
    type: string
    sql: ${TABLE}.api_payload ;;
  }

  dimension: logibec_appointment_id {
    type: string
    sql: substring_index(substring_index(${TABLE}.api_payload, 'id_appointment: ', -1),'id_lang:', 1) ;;
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

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: external_id_to_cancel {
    type: string
    sql: ${TABLE}.external_id_to_cancel ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: processed {
    type: yesno
    sql: ${TABLE}.processed ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: petal_status {
    type: string
    sql:
      CASE
        WHEN  ${TABLE}.status = 0 THEN "not_found"
        WHEN  ${TABLE}.status = 1 THEN "cancelled"
        WHEN  ${TABLE}.status = 2 THEN "already_sent"
        WHEN  ${TABLE}.status = 3 THEN "invalid_payload"
        WHEN  ${TABLE}.status = 4 THEN "no_matching_template"
        WHEN  ${TABLE}.status = 5 THEN "no_action_required"
        WHEN  ${TABLE}.status = 6 THEN "confirmed_action"
        WHEN  ${TABLE}.status = 7 THEN "cancelled_action"
        WHEN  ${TABLE}.status = 8 THEN "transfer_action"
        WHEN  ${TABLE}.status = 9 THEN "call_back_action"
        WHEN  ${TABLE}.status = 10 THEN "wrong_recipient"
        WHEN  ${TABLE}.status = 11 THEN "no_answer"
        WHEN  ${TABLE}.status = 12 THEN "too_late_to_send"
        WHEN  ${TABLE}.status = 13 THEN "missing_fields"
        WHEN  ${TABLE}.status = 14 THEN "voice_mail"
        WHEN  ${TABLE}.status = 15 THEN "invalid_email"
        WHEN  ${TABLE}.status = 16 THEN "problem_on_send"
        WHEN  ${TABLE}.status = 17 THEN "invalid_phone"
        WHEN  ${TABLE}.status = 18 THEN "hang_up_before_answer"
      END

    ;;
  }

  dimension: petal_status_explanation {
    type: string
    sql:
      CASE
        WHEN  ${TABLE}.status = 0 THEN "Did not find the notification to cancel in our database"
        WHEN  ${TABLE}.status = 1 THEN "Notification has been successfully cancelled"
        WHEN  ${TABLE}.status = 2 THEN "Notification has already been sent, it's too late to cancel it"
        WHEN  ${TABLE}.status = 3 THEN "Can't process payload received by API"
        WHEN  ${TABLE}.status = 4 THEN "Can't find a template matching locale and media"
        WHEN  ${TABLE}.status = 5 THEN "Notification has been successfully sent, but we do not need any answer from the patient"
        WHEN  ${TABLE}.status = 6 THEN "Patient has confirmed his appointment"
        WHEN  ${TABLE}.status = 7 THEN "Patient has cancelled his appointment"
        WHEN  ${TABLE}.status = 8 THEN "Patient asks for his appointment to be moved"
        WHEN  ${TABLE}.status = 9 THEN "Patient wants an assistant to call him back"
        WHEN  ${TABLE}.status = 10 THEN "Notification has been sent to wrong recipient (only on phone notification)"
        WHEN  ${TABLE}.status = 11 THEN "Patient did not answer the notification in time"
        WHEN  ${TABLE}.status = 12 THEN "Could not send the notification before the appointment"
        WHEN  ${TABLE}.status = 13 THEN "Template requires some fields that are not provided"
        WHEN  ${TABLE}.status = 14 THEN "A message has been left on contact's voice mail"
        WHEN  ${TABLE}.status = 15 THEN "Cannot send email due to wrong email format"
        WHEN  ${TABLE}.status = 16 THEN "Generic status when can't send the notification"
        WHEN  ${TABLE}.status = 17 THEN "Phone is not in a valid format"
        WHEN  ${TABLE}.status = 18 THEN "Verified identity, but no answer when template requires one"
      END

    ;;
  }

  dimension: logibec_response_id {
    type: number
    sql:
   CASE
        WHEN  ${TABLE}.status = 0 THEN 10
        WHEN  ${TABLE}.status = 1 THEN 8
        WHEN  ${TABLE}.status = 2 THEN 9
        WHEN  ${TABLE}.status = 3 THEN 99
        WHEN  ${TABLE}.status = 4 THEN 99
        WHEN  ${TABLE}.status = 5 THEN 0
        WHEN  ${TABLE}.status = 6 THEN 1
        WHEN  ${TABLE}.status = 7 THEN 2
        WHEN  ${TABLE}.status = 8 THEN 3
        WHEN  ${TABLE}.status = 9 THEN 4
        WHEN  ${TABLE}.status = 10 THEN 5
        WHEN  ${TABLE}.status = 11 THEN 6
        WHEN  ${TABLE}.status = 12 THEN 6
        WHEN  ${TABLE}.status = 13 THEN 99
        WHEN  ${TABLE}.status = 14 THEN 11
        WHEN  ${TABLE}.status = 15 THEN 99
        WHEN  ${TABLE}.status = 16 THEN 99
        WHEN  ${TABLE}.status = 17 THEN 99
        WHEN  ${TABLE}.status = 18 THEN 0
      END ;;
  }

  dimension: logibec_response_code {
    type: string
    sql:
   CASE
        WHEN  ${TABLE}.status = 0 THEN "not_found"
        WHEN  ${TABLE}.status = 1 THEN "cancelled"
        WHEN  ${TABLE}.status = 2 THEN "already_sent"
        WHEN  ${TABLE}.status = 3 THEN "invalid_payload"
        WHEN  ${TABLE}.status = 4 THEN "no_matching_template"
        WHEN  ${TABLE}.status = 5 THEN "no_action_required"
        WHEN  ${TABLE}.status = 6 THEN "confirmed_action"
        WHEN  ${TABLE}.status = 7 THEN "cancelled_action"
        WHEN  ${TABLE}.status = 8 THEN "transfer_action"
        WHEN  ${TABLE}.status = 9 THEN "call_back_action"
        WHEN  ${TABLE}.status = 10 THEN "wrong_recipient"
        WHEN  ${TABLE}.status = 11 THEN "no_answer"
        WHEN  ${TABLE}.status = 12 THEN "too_late_to_send"
        WHEN  ${TABLE}.status = 13 THEN "missing_fields"
        WHEN  ${TABLE}.status = 14 THEN "voice_mail"
        WHEN  ${TABLE}.status = 15 THEN "invalid_email"
        WHEN  ${TABLE}.status = 16 THEN "problem_on_send"
        WHEN  ${TABLE}.status = 17 THEN "invalid_phone"
        WHEN  ${TABLE}.status = 18 THEN "hang_up_before_answer"
      END ;;
  }

  dimension: logibec_error_code {
    type: string
    sql:
   CASE
        WHEN  ${TABLE}.status = 0 THEN ""
        WHEN  ${TABLE}.status = 1 THEN ""
        WHEN  ${TABLE}.status = 2 THEN ""
        WHEN  ${TABLE}.status = 3 THEN "missing_name_or_contact_infos_or_template"
        WHEN  ${TABLE}.status = 4 THEN "template_not_supporting_locale_or_media"
        WHEN  ${TABLE}.status = 5 THEN ""
        WHEN  ${TABLE}.status = 6 THEN ""
        WHEN  ${TABLE}.status = 7 THEN ""
        WHEN  ${TABLE}.status = 8 THEN ""
        WHEN  ${TABLE}.status = 9 THEN ""
        WHEN  ${TABLE}.status = 10 THEN ""
        WHEN  ${TABLE}.status = 11 THEN ""
        WHEN  ${TABLE}.status = 12 THEN ""
        WHEN  ${TABLE}.status = 13 THEN "missing_fields_to_send_template"
        WHEN  ${TABLE}.status = 14 THEN ""
        WHEN  ${TABLE}.status = 15 THEN "invalid_email"
        WHEN  ${TABLE}.status = 16 THEN "problem_on_send"
        WHEN  ${TABLE}.status = 17 THEN "invalid_phone"
        WHEN  ${TABLE}.status = 18 THEN ""
      END ;;
  }

  dimension_group: status_change {
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
    sql: ${TABLE}.status_change_time ;;
  }

  dimension: template_group_id {
    type: number
    sql: ${TABLE}.template_group_id ;;
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
    drill_fields: [id, groups.name, groups.parent_group_id]
  }
}
