view: product_audience_kinds {
  sql_table_name: petalmd.product_audience_kinds ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: mnemonic {
    type: string
    sql: ${TABLE}.mnemonic ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
