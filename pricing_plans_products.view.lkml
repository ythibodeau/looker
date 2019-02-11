view: pricing_plans_products {
  sql_table_name: petalmd.pricing_plans_products ;;

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

  dimension: plan_id {
    type: number
    sql: ${TABLE}.plan_id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
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
    drill_fields: [id, products.id, products.name]
  }
}