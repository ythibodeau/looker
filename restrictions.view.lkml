view: restrictions {
  sql_table_name: petalmd.restrictions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
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

  dimension: is_migrated {
    type: yesno
    sql: ${TABLE}.is_migrated ;;
  }

  dimension: oncall_day_id {
    type: number
    sql: ${TABLE}.oncall_day_id ;;
  }

  dimension: oncall_evening_id {
    type: number
    sql: ${TABLE}.oncall_evening_id ;;
  }

  dimension: restrictable_id {
    type: number
    sql: ${TABLE}.restrictable_id ;;
  }

  dimension: restrictable_type {
    type: string
    sql: ${TABLE}.restrictable_type ;;
  }

  dimension: task_afternoon_id {
    type: number
    sql: ${TABLE}.task_afternoon_id ;;
  }

  dimension: task_evening_id {
    type: number
    sql: ${TABLE}.task_evening_id ;;
  }

  dimension: task_lunch_id {
    type: number
    sql: ${TABLE}.task_lunch_id ;;
  }

  dimension: task_morning_id {
    type: number
    sql: ${TABLE}.task_morning_id ;;
  }

  dimension: task_next_night_id {
    type: number
    sql: ${TABLE}.task_next_night_id ;;
  }

  dimension: task_night_id {
    type: number
    sql: ${TABLE}.task_night_id ;;
  }

  dimension: task_previous_evening_id {
    type: number
    sql: ${TABLE}.task_previous_evening_id ;;
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