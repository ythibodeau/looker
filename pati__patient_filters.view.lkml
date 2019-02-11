view: pati__patient_filters {
  sql_table_name: petalmd.pati__patient_filters ;;

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

  dimension: from_age {
    type: number
    sql: ${TABLE}.from_age ;;
  }

  dimension: gender {
    type: number
    sql: ${TABLE}.gender ;;
  }

  dimension: min_days_between_appointments {
    type: number
    sql: ${TABLE}.min_days_between_appointments ;;
  }

  dimension: to_age {
    type: number
    sql: ${TABLE}.to_age ;;
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