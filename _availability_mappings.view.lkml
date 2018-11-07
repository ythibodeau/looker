view: _availability_mappings {
  sql_table_name: petalmd_development.sche__availability_mappings ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: block_kind_abbreviation {
    type: string
    sql: ${TABLE}.block_kind_abbreviation ;;
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

  dimension: cwdays_filter {
    type: string
    sql: ${TABLE}.cwdays_filter ;;
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

  dimension: explicit_reason_long {
    type: string
    sql: ${TABLE}.explicit_reason_long ;;
  }

  dimension: explicit_reason_short {
    type: string
    sql: ${TABLE}.explicit_reason_short ;;
  }

  dimension: from_group_id {
    type: number
    sql: ${TABLE}.from_group_id ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: holidays_filter {
    type: string
    sql: ${TABLE}.holidays_filter ;;
  }

  dimension: offset {
    type: number
    sql: ${TABLE}.offset ;;
  }

  dimension: oncall_afternoon {
    type: yesno
    sql: ${TABLE}.oncall_afternoon ;;
  }

  dimension: oncall_evening {
    type: yesno
    sql: ${TABLE}.oncall_evening ;;
  }

  dimension: oncall_morning {
    type: yesno
    sql: ${TABLE}.oncall_morning ;;
  }

  dimension: oncall_night {
    type: yesno
    sql: ${TABLE}.oncall_night ;;
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

  dimension: task_afternoon {
    type: yesno
    sql: ${TABLE}.task_afternoon ;;
  }

  dimension: task_evening {
    type: yesno
    sql: ${TABLE}.task_evening ;;
  }

  dimension: task_kind_abbreviation {
    type: string
    sql: ${TABLE}.task_kind_abbreviation ;;
  }

  dimension: task_morning {
    type: yesno
    sql: ${TABLE}.task_morning ;;
  }

  dimension: task_night {
    type: yesno
    sql: ${TABLE}.task_night ;;
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
