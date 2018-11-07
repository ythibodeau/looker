view: pati__tasks {
  sql_table_name: petalmd_development.pati__tasks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: actual_waiting_room_id {
    type: number
    sql: ${TABLE}.actual_waiting_room_id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: color {
    type: number
    sql: ${TABLE}.color ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: description_en {
    type: string
    sql: ${TABLE}.description_en ;;
  }

  dimension: description_fr_ca {
    type: string
    sql: ${TABLE}.description_fr_ca ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: family_doctor_mandatory {
    type: yesno
    sql: ${TABLE}.family_doctor_mandatory ;;
  }

  dimension: reason_id {
    type: number
    sql: ${TABLE}.reason_id ;;
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
