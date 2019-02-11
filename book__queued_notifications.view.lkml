view: book__queued_notifications {
  sql_table_name: petalmd.book__queued_notifications ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: acknowledged_by_third_party {
    type: yesno
    sql: ${TABLE}.acknowledged_by_third_party ;;
  }

  dimension: action {
    type: number
    sql: ${TABLE}.action ;;
  }

  dimension: api_payload {
    type: string
    sql: ${TABLE}.api_payload ;;
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

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: external_id_to_cancel {
    type: string
    sql: ${TABLE}.external_id_to_cancel ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: processed {
    type: yesno
    sql: ${TABLE}.processed ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension_group: status_change {
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
    sql: ${TABLE}.status_change_time ;;
  }

  dimension: template_group_id {
    type: number
    sql: ${TABLE}.template_group_id ;;
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