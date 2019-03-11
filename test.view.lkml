view: test {
  derived_table: {
    sql: select id , accepted_at as action_date, "A" as action from pati__patients where state = 3
      union
      select target_id, sent_at as action_date, "R" as action from noti__notifications
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: action_date {
    type: time
    sql: ${TABLE}.action_date ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  set: detail {
    fields: [id, action_date_time, action]
  }
}
