view: profiles {
  sql_table_name: petalmd_development.profiles ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: absence_sync {
    type: yesno
    sql: ${TABLE}.absence_sync ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: calendar_detailed_view {
    type: yesno
    sql: ${TABLE}.calendar_detailed_view ;;
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

  dimension: group_calendar_detailed_view {
    type: yesno
    sql: ${TABLE}.group_calendar_detailed_view ;;
  }

  dimension: raw_keywords {
    type: string
    sql: ${TABLE}.raw_keywords ;;
  }

  dimension: receive_late_schedule {
    type: yesno
    sql: ${TABLE}.receive_late_schedule ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      accounts.id,
      accounts.username,
      accounts.first_name,
      accounts.middle_name,
      accounts.last_name,
      pati__patients.count,
      pati__subscriptions.count,
      profile_preferences.count
    ]
  }
}
