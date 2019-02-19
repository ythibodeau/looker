view: account_kinds_specialties {
  sql_table_name: petalmd.account_kinds_specialties ;;

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

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: specialty_id {
    type: number
    sql: ${TABLE}.specialty_id ;;
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
    drill_fields: []
  }
}