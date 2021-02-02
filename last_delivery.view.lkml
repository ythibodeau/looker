view: last_delivery {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT n.id as notification_id,
             MAX(d.id) as delivery_id
      FROM book__notifications n
      LEFT JOIN book__notification_deliveries d
      ON n.id = d.notification_id
      GROUP BY n.id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: notification_id {
    type: number
    sql: ${TABLE}.notification_id ;;
  }

  dimension: delivery_id {
    type: number
    sql: ${TABLE}.delivery_id ;;
  }

  set: detail {
    fields: [notification_id, delivery_id]
  }
}
