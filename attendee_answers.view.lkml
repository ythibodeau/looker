view: attendee_answers {
  sql_table_name: petalmd.attendee_answers ;;

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