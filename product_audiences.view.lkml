view: product_audiences {
  sql_table_name: petalmd_development.product_audiences ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_id ;;
  }

  dimension: productable_id {
    type: number
    sql: ${TABLE}.productable_id ;;
  }

  dimension: productable_type {
    type: string
    sql: ${TABLE}.productable_type ;;
  }

  measure: count {
    type: count
    drill_fields: [id, products.id, products.name]
  }
}
