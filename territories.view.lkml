view: territories {
  sql_table_name: petalmd.territories ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
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