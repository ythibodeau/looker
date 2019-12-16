view: pricing_suites {
  sql_table_name: petalmd.pricing_suites ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
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

  dimension: name_en {
    type: string
    sql: ${TABLE}.name_en ;;
  }

  dimension: name_fr_ca {
    type: string
    sql: ${TABLE}.name_fr_ca ;;
  }

  dimension: product_name {
    type: string
    sql: CASE
           WHEN ${code} = 'md_schedule' THEN 'Scheduling'
           WHEN ${code} = 'hospital' THEN 'Scheduling'
           WHEN ${code} = 'booking' THEN 'Booking'
           WHEN ${code} = 'petal_message' THEN 'Messaging'
         END
        ;;
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
