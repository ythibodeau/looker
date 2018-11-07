view: book__notification_template_groups {
  sql_table_name: petalmd_development.book__notification_template_groups ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: allow_call_back {
    type: yesno
    sql: ${TABLE}.allow_call_back ;;
  }

  dimension: allow_cancel {
    type: yesno
    sql: ${TABLE}.allow_cancel ;;
  }

  dimension: allow_confirm {
    type: yesno
    sql: ${TABLE}.allow_confirm ;;
  }

  dimension: allow_transfer {
    type: yesno
    sql: ${TABLE}.allow_transfer ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
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

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: deactivated {
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
    sql: ${TABLE}.deactivated_at ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: temporary {
    type: yesno
    sql: ${TABLE}.temporary ;;
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

  dimension: updated_by_id {
    type: number
    sql: ${TABLE}.updated_by_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, groups.name, groups.parent_group_id]
  }
}
