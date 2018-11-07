view: pati__form_questions {
  sql_table_name: petalmd_development.pati__form_questions ;;

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

  dimension: days_before_appointment {
    type: number
    sql: ${TABLE}.days_before_appointment ;;
  }

  dimension: description_en {
    type: string
    sql: ${TABLE}.description_en ;;
  }

  dimension: description_fr_ca {
    type: string
    sql: ${TABLE}.description_fr_ca ;;
  }

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: form_id {
    type: number
    sql: ${TABLE}.form_id ;;
  }

  dimension: is_required {
    type: yesno
    sql: ${TABLE}.is_required ;;
  }

  dimension: kind {
    type: number
    sql: ${TABLE}.kind ;;
  }

  dimension: link_id {
    type: number
    sql: ${TABLE}.link_id ;;
  }

  dimension: link_message_en {
    type: string
    sql: ${TABLE}.link_message_en ;;
  }

  dimension: link_message_fr_ca {
    type: string
    sql: ${TABLE}.link_message_fr_ca ;;
  }

  dimension: link_type {
    type: number
    sql: ${TABLE}.link_type ;;
  }

  dimension: no_availability_message_en {
    type: string
    sql: ${TABLE}.no_availability_message_en ;;
  }

  dimension: no_availability_message_fr_ca {
    type: string
    sql: ${TABLE}.no_availability_message_fr_ca ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: title_en {
    type: string
    sql: ${TABLE}.title_en ;;
  }

  dimension: title_fr_ca {
    type: string
    sql: ${TABLE}.title_fr_ca ;;
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
}
