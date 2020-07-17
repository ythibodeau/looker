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

  dimension: oncall_afternoon_category_acronym {
    label: "oncall_afternoon_category_acronym"
    type: string
    sql: ${categories_oncall_afternoon.explicit_acronym} ;;
  }

  dimension: oncall_evening_category_id {
    type: number
    sql: ${TABLE}.oncall_evening_category_id ;;
  }

  dimension: oncall_evening_category_acronym {
    label: "oncall_afternoon_category_acronym"
    type: string
    sql: ${categories_oncall_evening.explicit_acronym} ;;
  }

  dimension: oncall_morning_category_id {
    type: number
    sql: ${TABLE}.oncall_morning_category_id ;;
  }

  dimension: oncall_morning_category_acronym {
    label: "oncall_morning_category_acronym"
    type: number
    sql: ${categories_oncall_morning.explicit_acronym} ;;
  }

  dimension: oncall_night_category_id {
    type: number
    sql: ${TABLE}.oncall_night_category_id ;;
  }

  dimension: oncall_night_category_acronym {
    label: "oncall_night_category_acronym"
    type: number
    sql:  ${categories_oncall_night.explicit_acronym} ;;
  }

  dimension: task_afternoon_category_id {
    type: number
    sql: ${TABLE}.task_afternoon_category_id ;;
  }

  dimension: task_afternoon_category_acronym {
    label: "task_afternoon_category_acronym"
    type: number
    sql: ${categories_task_afternoon.explicit_acronym} ;;
  }

  dimension: task_evening_category_id {
    type: number
    sql: ${TABLE}.task_evening_category_id ;;
  }

  dimension: task_evening_category_acronym {
    label: "task_evening_category_acronym"
    type: number
    sql: ${categories_task_evening.explicit_acronym};;
  }

  dimension: task_morning_category_id {
    type: number
    sql: ${TABLE}.task_morning_category_id ;;
  }

  dimension: task_morning_category_acronym {
    label: "task_morning_category_acronym"
    type: number
    sql: ${categories_task_morning.explicit_acronym} ;;
  }

  dimension: task_night_category_id {
    type: number
    sql: ${TABLE}.task_night_category_id ;;
  }

  dimension: task_night_category_acronym {
    label: "task_night_category_acronym"
    type: number
    sql: ${categories_task_night.explicit_acronym} ;;
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

  measure: count_distinct_account {
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      accounts.first_name,
      accounts.last_name,
      groups.acronym,
      groups.name,
      task_morning_category_acronym,
      oncall_morning_category_acronym,
      task_afternoon_category_acronym,
      oncall_afternoon_category_acronym,
      task_evening_category_acronym,
      oncall_evening_category_acronym,
      task_night_category_acronym,
      oncall_night_category_acronym
    ]
  }
}
