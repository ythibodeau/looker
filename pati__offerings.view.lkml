view: pati__offerings {
  sql_table_name: petalmd.pati__offerings ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: allow_multiple_appointments {
    type: yesno
    sql: ${TABLE}.allow_multiple_appointments ;;
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

  dimension: deactivated {
    type: yesno
    sql: ${TABLE}.deactivated ;;
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

  dimension: family_doctor_mandatory {
    type: yesno
    sql: ${TABLE}.family_doctor_mandatory ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: message_en {
    type: string
    sql: ${TABLE}.message_en ;;
  }

  dimension: message_fr_ca {
    type: string
    sql: ${TABLE}.message_fr_ca ;;
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

  dimension: web_offering {
    type: yesno
    sql: ${TABLE}.web_offering ;;
  }

  measure: count {
    type: count
    drill_fields: [id, groups.name, groups.parent_group_id]
  }
}