view: _absence_days {
  sql_table_name: petalmd_development.sche__absence_days ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: afternoon_long {
    type: string
    sql: ${TABLE}.afternoon_long ;;
  }

  dimension: afternoon_sequence {
    type: number
    sql: ${TABLE}.afternoon_sequence ;;
  }

  dimension: afternoon_short {
    type: string
    sql: ${TABLE}.afternoon_short ;;
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

  dimension: day_id {
    type: number
    sql: ${TABLE}.day_id ;;
  }

  dimension: morning_long {
    type: string
    sql: ${TABLE}.morning_long ;;
  }

  dimension: morning_sequence {
    type: number
    sql: ${TABLE}.morning_sequence ;;
  }

  dimension: morning_short {
    type: string
    sql: ${TABLE}.morning_short ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
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
