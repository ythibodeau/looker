view: mess__mobile_notif_preferences {
  sql_table_name: petalmd.mess__mobile_notif_preferences ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
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

  dimension: mode {
    type: number
    sql: ${TABLE}.mode ;;
  }

  dimension: normal_sound_name {
    type: string
    sql: ${TABLE}.normal_sound_name ;;
  }

  dimension: special_sound_name {
    type: string
    sql: ${TABLE}.special_sound_name ;;
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

  dimension: vibration_normal_activated {
    type: yesno
    sql: ${TABLE}.vibration_normal_activated ;;
  }

  dimension: vibration_special_activated {
    type: yesno
    sql: ${TABLE}.vibration_special_activated ;;
  }

  measure: count {
    type: count
    drill_fields: [id, normal_sound_name, special_sound_name]
  }
}
