view: absence_unit_combinations {
  sql_table_name: petalmd.absence_unit_combinations ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: mnemonic {
    type: string
    sql: ${TABLE}.mnemonic ;;
  }

  dimension: units {
    type: string
    sql: ${TABLE}.units ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}