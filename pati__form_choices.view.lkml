view: pati__form_choices {
  sql_table_name: petalmd.pati__form_choices ;;

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

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
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

  dimension: question_id {
    type: number
    sql: ${TABLE}.question_id ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: text_en {
    type: string
    sql: ${TABLE}.text_en ;;
  }

  dimension: text_fr_ca {
    type: string
    sql: ${TABLE}.text_fr_ca ;;
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