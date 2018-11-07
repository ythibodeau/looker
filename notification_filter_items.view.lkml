view: notification_filter_items {
  sql_table_name: petalmd_development.notification_filter_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: notifiable_id {
    type: number
    sql: ${TABLE}.notifiable_id ;;
  }

  dimension: notifiable_type {
    type: string
    sql: ${TABLE}.notifiable_type ;;
  }

  dimension: notification_filter_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.notification_filter_id ;;
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
    drill_fields: [id, notification_filters.id]
  }
}
