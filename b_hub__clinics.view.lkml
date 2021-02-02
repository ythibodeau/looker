view: b_hub__clinics {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select g.id as id,
      g.ramq_external_id as ramq_id,
      g.go_live_date as go_live_date
      from `groups` g
      where g.booking_hub_managed = 1
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

  dimension: ramq_id {
    type: string
    sql: ${TABLE}.ramq_id ;;
  }

  dimension: go_live_date {
    type: date
    sql: ${TABLE}.go_live_date ;;
  }

  set: detail {
    fields: [id, ramq_id, go_live_date]
  }
}
