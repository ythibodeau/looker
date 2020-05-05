view: booking_actions {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select (@row_number:=@row_number + 1) AS id,
       x.account_id as account_id,
       x.action as action,
       x.signup as signup,
       x.action_date as action_date
       FROM
       (SELECT @row_number:=0) AS t, (
      SELECT DISTINCT APPT.created_by_id AS account_id,
             "created_appointment" AS action,
             A.confirmed_at AS signup,
             DATE_FORMAT(APPT.created_at, '%Y-%m-%d') as action_date
      FROM pati__appointments APPT
      INNER JOIN accounts A on A.id = APPT.created_by_id
      WHERE APPT.created_by_type = "Account"
      UNION
      SELECT DISTINCT APPT.cancelled_by_id AS account_id,
             "cancel_appointment" AS action,
             A.confirmed_at AS signup,
             DATE_FORMAT(APPT.cancelled_at, '%Y-%m-%d') as action_date
      FROM pati__appointments APPT
      INNER JOIN accounts A on A.id = APPT.cancelled_by_id
      WHERE APPT.cancelled_by_type = "Account"
            UNION
      SELECT DISTINCT APPT.note_edited_by_id AS account_id,
             "appointment_note" AS action,
             A.confirmed_at AS signup,
             DATE_FORMAT(APPT.note_edited_at, '%Y-%m-%d') as action_date
      FROM pati__appointments APPT
      INNER JOIN accounts A on A.id = APPT.note_edited_by_id ) as x
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

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  measure: unique_account {
    type: count_distinct
    sql: ${account_id} ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension_group: signup {
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
    sql: ${TABLE}.signup ;;
    convert_tz: no
  }

  dimension_group: action_date {
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
    sql: ${TABLE}.action_date ;;
    convert_tz: no
  }

  set: detail {
    fields: [id, account_id, action, signup_time, action_date_date]
  }
}
