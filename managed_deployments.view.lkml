view: managed_deployments {
  sql_table_name: petalmd.managed_deployments ;;

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

  dimension: reload_message_en {
    type: string
    sql: ${TABLE}.reload_message_en ;;
  }

  dimension: reload_message_fr_ca {
    type: string
    sql: ${TABLE}.reload_message_fr_ca ;;
  }

  dimension: reload_required {
    type: yesno
    sql: ${TABLE}.reload_required ;;
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

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  dimension: warning_message_en {
    type: string
    sql: ${TABLE}.warning_message_en ;;
  }

  dimension: warning_message_fr_ca {
    type: string
    sql: ${TABLE}.warning_message_fr_ca ;;
  }

  dimension: warning_required {
    type: yesno
    sql: ${TABLE}.warning_required ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}