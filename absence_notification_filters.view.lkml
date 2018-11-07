view: absence_notification_filters {
  sql_table_name: petalmd_development.absence_notification_filters ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: absence_notification_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.absence_notification_id ;;
  }

  dimension: filterable_id {
    type: number
    sql: ${TABLE}.filterable_id ;;
  }

  dimension: filterable_type {
    type: string
    sql: ${TABLE}.filterable_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, absence_notifications.id]
  }
}
