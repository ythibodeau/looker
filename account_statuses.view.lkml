view: account_statuses {
  sql_table_name: petalmd_development.account_statuses ;;

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
