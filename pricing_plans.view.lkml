view: pricing_plans {
  sql_table_name: petalmd.pricing_plans ;;

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

  dimension: hubspot_id {
    type: string
    sql: ${TABLE}.hubspot_id ;;
  }

  dimension: name_en {
    type: string
    sql: ${TABLE}.name_en ;;
  }

  dimension: name_fr_ca {
    type: string
    sql: ${TABLE}.name_fr_ca ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: status {
    type: number
    sql: ${TABLE}.status ;;
  }

  dimension: suite_id {
    type: number
    sql: ${TABLE}.suite_id ;;
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

  dimension: is_scheduling_plan {
    type: yesno
    sql: ${suite_id} = 1 ;;
  }

  dimension: is_booking_plan {
    type: yesno
    sql: ${suite_id} = 4 ;;
  }

  dimension: is_hospital_plan {
    type: yesno
    sql: ${suite_id} = 3 ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
