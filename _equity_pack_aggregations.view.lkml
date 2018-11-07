view: _equity_pack_aggregations {
  sql_table_name: petalmd_development.sche__equity_pack_aggregations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: aggregated_pack_id {
    type: number
    sql: ${TABLE}.aggregated_pack_id ;;
  }

  dimension: aggregator_pack_id {
    type: number
    sql: ${TABLE}.aggregator_pack_id ;;
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
