view: pati__visibility_blocks {
  sql_table_name: petalmd.pati__visibility_blocks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: context_id {
    type: number
    sql: ${TABLE}.context_id ;;
  }

  dimension: context_type {
    type: string
    sql: ${TABLE}.context_type ;;
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

  dimension: duration {
    type: string
    sql: ${TABLE}.duration ;;
  }

  dimension: interval {
    type: string
    sql: ${TABLE}.`interval` ;;
  }

  dimension: order {
    type: number
    sql: ${TABLE}.`order` ;;
  }

  dimension: unlock_offset {
    type: string
    sql: ${TABLE}.unlock_offset ;;
  }

  dimension: offset_in_hours {
    description: "Offset value in hours"
    type: number
    sql:
    CASE
      WHEN ${TABLE}.unlock_offset LIKE "%43200S%" THEN -12
      WHEN ${TABLE}.unlock_offset LIKE "%10800S%" THEN -3
      WHEN ${TABLE}.unlock_offset LIKE "%14400S%" THEN -4
      WHEN ${TABLE}.unlock_offset LIKE "%11H30M%" THEN -11.5
      WHEN ${TABLE}.unlock_offset LIKE "%PT11H%" THEN -11
      WHEN ${TABLE}.unlock_offset LIKE "%PT2H%" THEN -2
      WHEN ${TABLE}.unlock_offset LIKE "%P2D%" THEN -48
      WHEN ${TABLE}.unlock_offset LIKE "%PT4H%" THEN -4
      WHEN ${TABLE}.unlock_offset LIKE "%PT15H%" THEN -15
      WHEN ${TABLE}.unlock_offset LIKE "%PT1H%" OR ${TABLE}.unlock_offset LIKE "%3600S%" THEN -1
      WHEN ${TABLE}.unlock_offset LIKE "%P1D%" OR  ${TABLE}.unlock_offset LIKE "%P83988S%"  THEN -24
      WHEN ${TABLE}.unlock_offset LIKE "%18000S%" THEN -5
      WHEN ${TABLE}.unlock_offset LIKE "%P4D%" THEN -96
      WHEN ${TABLE}.unlock_offset LIKE "%P14D%" THEN -336
      WHEN ${TABLE}.unlock_offset LIKE "%57600S%" THEN -16
      WHEN ${TABLE}.unlock_offset LIKE "%P30D%" THEN -720
      WHEN ${TABLE}.unlock_offset LIKE "%P7D%" THEN -168
      WHEN ${TABLE}.unlock_offset LIKE "%36000S%" THEN -10
      WHEN ${TABLE}.unlock_offset LIKE "%44100S%" THEN -12.25
      WHEN ${TABLE}.unlock_offset LIKE "%7200S%" THEN -2
      WHEN ${TABLE}.unlock_offset LIKE "%P5D%" THEN -120
      WHEN ${TABLE}.unlock_offset LIKE "%50400S%" THEN -14
      WHEN ${TABLE}.unlock_offset LIKE "%68400%" THEN -19
      WHEN ${TABLE}.unlock_offset LIKE "%P90D%" THEN -2160
      WHEN ${TABLE}.unlock_offset LIKE "%P6D%" THEN -144
      ELSE 0
    END
    ;;
  }

  dimension_group: real_availability_start_time {
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
    sql: CAST(SUBSTRING_INDEX(SUBSTRING_INDEX(${TABLE}.interval,'/',-2),'/',1) AS TIME)  ;;
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
