view: _teams {
  sql_table_name: petalmd_development.sche__teams ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: abbreviation {
    type: string
    sql: ${TABLE}.abbreviation ;;
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

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: show_dashboard {
    type: yesno
    sql: ${TABLE}.show_dashboard ;;
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
