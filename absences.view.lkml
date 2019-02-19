view: absences {
  sql_table_name: petalmd.absences ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: absence {
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
    sql: ${TABLE}.absence_date ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
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

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: oncall_afternoon_category_id {
    type: number
    sql: ${TABLE}.oncall_afternoon_category_id ;;
  }

  dimension: oncall_evening_category_id {
    type: number
    sql: ${TABLE}.oncall_evening_category_id ;;
  }

  dimension: oncall_morning_category_id {
    type: number
    sql: ${TABLE}.oncall_morning_category_id ;;
  }

  dimension: oncall_night_category_id {
    type: number
    sql: ${TABLE}.oncall_night_category_id ;;
  }

  dimension: task_afternoon_category_id {
    type: number
    sql: ${TABLE}.task_afternoon_category_id ;;
  }

  dimension: task_evening_category_id {
    type: number
    sql: ${TABLE}.task_evening_category_id ;;
  }

  dimension: task_morning_category_id {
    type: number
    sql: ${TABLE}.task_morning_category_id ;;
  }

  dimension: task_night_category_id {
    type: number
    sql: ${TABLE}.task_night_category_id ;;
  }

  dimension: timezone_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.timezone_id ;;
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
      groups.name,
      groups.parent_group_id,
      timezones.id
    ]
  }
}