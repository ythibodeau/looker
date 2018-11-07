view: participant_folders {
  sql_table_name: petalmd_development.participant_folders ;;

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

  dimension: folder_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.folder_id ;;
  }

  dimension: participant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.participant_id ;;
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
    drill_fields: [id, folders.id, folders.name, participants.id]
  }
}
