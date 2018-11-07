view: _equity_lines {
  sql_table_name: petalmd_development.sche__equity_lines ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: adjustment {
    type: number
    sql: ${TABLE}.adjustment ;;
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

  dimension: final {
    type: number
    sql: ${TABLE}.final ;;
  }

  dimension: initial_adjustment {
    type: number
    sql: ${TABLE}.initial_adjustment ;;
  }

  dimension: initial_kind_id {
    type: number
    sql: ${TABLE}.initial_kind_id ;;
  }

  dimension: initial_value {
    type: number
    sql: ${TABLE}.initial_value ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: pack_id {
    type: number
    sql: ${TABLE}.pack_id ;;
  }

  dimension: previous {
    type: number
    sql: ${TABLE}.previous ;;
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

  dimension: value {
    type: number
    sql: ${TABLE}.value ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
