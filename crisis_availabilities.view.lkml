view: crisis_availabilities {
  sql_table_name: petalmd.crisis_availabilities ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: absent {
    type: yesno
    sql: ${TABLE}.absent ;;
  }

  dimension: absent_note {
    type: string
    sql: ${TABLE}.absent_note ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
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

  dimension: infected {
    type: yesno
    sql: ${TABLE}.infected ;;
  }

  dimension: infected_note {
    type: string
    sql: ${TABLE}.infected_note ;;
  }

  dimension: quarantine {
    type: yesno
    sql: ${TABLE}.quarantine ;;
  }

  dimension: quarantine_note {
    type: string
    sql: ${TABLE}.quarantine_note ;;
  }

  dimension: relieved {
    type: number
    sql: ${TABLE}.relieved ;;
  }

  dimension: remote {
    type: yesno
    sql: ${TABLE}.remote ;;
  }

  dimension: remote_note {
    type: string
    sql: ${TABLE}.remote_note ;;
  }

  dimension_group: return {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.return_date ;;
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
