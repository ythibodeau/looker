view: simple__time_selectors {
  sql_table_name: petalmd_development.simple__time_selectors ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: consider_blocks {
    type: yesno
    sql: ${TABLE}.consider_blocks ;;
  }

  dimension: consider_periods {
    type: yesno
    sql: ${TABLE}.consider_periods ;;
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

  dimension_group: end {
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
    sql: ${TABLE}.end_date ;;
  }

  dimension: end_week_index {
    type: number
    sql: ${TABLE}.end_week_index ;;
  }

  dimension: holidays {
    type: number
    sql: ${TABLE}.holidays ;;
  }

  dimension: is_fri {
    type: yesno
    sql: ${TABLE}.is_fri ;;
  }

  dimension: is_mon {
    type: yesno
    sql: ${TABLE}.is_mon ;;
  }

  dimension: is_sat {
    type: yesno
    sql: ${TABLE}.is_sat ;;
  }

  dimension: is_sun {
    type: yesno
    sql: ${TABLE}.is_sun ;;
  }

  dimension: is_thu {
    type: yesno
    sql: ${TABLE}.is_thu ;;
  }

  dimension: is_tue {
    type: yesno
    sql: ${TABLE}.is_tue ;;
  }

  dimension: is_wed {
    type: yesno
    sql: ${TABLE}.is_wed ;;
  }

  dimension: kind {
    type: number
    sql: ${TABLE}.kind ;;
  }

  dimension: schedule_configuration_id {
    type: number
    sql: ${TABLE}.schedule_configuration_id ;;
  }

  dimension_group: start {
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
    sql: ${TABLE}.start_date ;;
  }

  dimension: start_week_index {
    type: number
    sql: ${TABLE}.start_week_index ;;
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
