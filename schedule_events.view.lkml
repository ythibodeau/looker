view: schedule_events {
  sql_table_name: petalmd_development.schedule_events ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: annotation {
    type: string
    sql: ${TABLE}.annotation ;;
  }

  dimension: approved {
    type: yesno
    sql: ${TABLE}.approved ;;
  }

  dimension: assignment_id {
    type: number
    sql: ${TABLE}.assignment_id ;;
  }

  dimension: block_kind_abbreviation {
    type: string
    sql: ${TABLE}.block_kind_abbreviation ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: console_print_moments {
    type: number
    sql: ${TABLE}.console_print_moments ;;
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

  dimension: end_moment {
    type: number
    sql: ${TABLE}.end_moment ;;
  }

  dimension: explicit_row_name {
    type: string
    sql: ${TABLE}.explicit_row_name ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: print_moments {
    type: number
    sql: ${TABLE}.print_moments ;;
  }

  dimension: requirement_id {
    type: number
    sql: ${TABLE}.requirement_id ;;
  }

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
  }

  dimension: restriction_kind_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.restriction_kind_id ;;
  }

  dimension: split {
    type: yesno
    sql: ${TABLE}.split ;;
  }

  dimension: split_next_day {
    type: number
    sql: ${TABLE}.split_next_day ;;
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

  dimension: start_moment {
    type: number
    sql: ${TABLE}.start_moment ;;
  }

  dimension: task_abbreviation {
    type: string
    sql: ${TABLE}.task_abbreviation ;;
  }

  dimension: task_event_description {
    type: string
    sql: ${TABLE}.task_event_description ;;
  }

  dimension: task_event_name {
    type: string
    sql: ${TABLE}.task_event_name ;;
  }

  dimension: task_kind_id {
    type: number
    sql: ${TABLE}.task_kind_id ;;
  }

  dimension: task_note {
    type: string
    sql: ${TABLE}.task_note ;;
  }

  dimension: template_kind_id {
    type: number
    sql: ${TABLE}.template_kind_id ;;
  }

  dimension: timezone_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.timezone_id ;;
  }

  dimension: transferable {
    type: yesno
    sql: ${TABLE}.transferable ;;
  }

  dimension: unassignable {
    type: yesno
    sql: ${TABLE}.unassignable ;;
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

  dimension: weekly_row_id {
    type: number
    sql: ${TABLE}.weekly_row_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      task_event_name,
      explicit_row_name,
      groups.name,
      groups.parent_group_id,
      accounts.id,
      accounts.username,
      accounts.first_name,
      accounts.middle_name,
      accounts.last_name,
      restriction_kinds.id,
      timezones.id
    ]
  }
}
