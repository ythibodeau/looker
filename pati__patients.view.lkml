view: pati__patients {
  sql_table_name: petalmd.pati__patients ;;

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

  dimension: asked_password_reset {
    type: yesno
    sql: ${TABLE}.asked_password_reset ;;
  }

  dimension_group: birth {
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
    sql: ${TABLE}.birth_date ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: number
    sql: ${TABLE}.gender ;;
  }

  dimension: hin {
    type: string
    sql: ${TABLE}.hin ;;
  }

  dimension: hin_expiration_month {
    type: number
    sql: ${TABLE}.hin_expiration_month ;;
  }

  dimension: hin_expiration_year {
    type: number
    sql: ${TABLE}.hin_expiration_year ;;
  }

  dimension_group: last_active {
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

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: patient_agreement {
    type: string
    sql: ${TABLE}.patient_agreement ;;
  }

  dimension: phone_token {
    type: string
    sql: ${TABLE}.phone_token ;;
  }

  dimension: profile_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.profile_id ;;
  }

  dimension: salt {
    type: string
    sql: ${TABLE}.salt ;;
  }

  dimension: state {
    type: number
    sql: ${TABLE}.state ;;
    #drill_fields: [email]
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

  dimension: accepted_month_only {
    type: number
    sql: MONTH(${TABLE}.accepted_at);;
  }

  # TEST
  dimension: last_subscription {
    type: yesno
    sql: MAX(${pati__subscriptions.sharing_consent}) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_confirmed {
    label: "Confirmed Patients Count"
    type: count
    filters: {
      field: state
      value: "3"
    }

  }

  measure: running_total_confirmed {
    label: "Running Total Confirmed Count"
    type: running_total
    sql: ${count_confirmed} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      groups.name,
      count
    ]
  }
}
