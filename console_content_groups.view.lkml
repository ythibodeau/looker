view: console_content_groups {
  sql_table_name: petalmd.console_content_groups ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: console_group_id {
    type: number
    sql: ${TABLE}.console_group_id ;;
  }

  dimension: content_group_id {
    type: number
    sql: ${TABLE}.content_group_id ;;
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
    drill_fields: [id]
  }

  measure: count_console_groups {
    type: count_distinct
    sql: ${TABLE}.content_group_id ;;
  }
}
