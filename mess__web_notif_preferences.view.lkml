view: mess__web_notif_preferences {
  sql_table_name: petalmd.mess__web_notif_preferences ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
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

  dimension: delay {
    type: number
    sql: ${TABLE}.delay ;;
  }

  dimension: notif_chat_setting {
    type: number
    sql: ${TABLE}.notif_chat_setting ;;
  }

  dimension: notif_hospital_setting {
    type: number
    sql: ${TABLE}.notif_hospital_setting ;;
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
