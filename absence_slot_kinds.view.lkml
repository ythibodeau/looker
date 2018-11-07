view: absence_slot_kinds {
  sql_table_name: petalmd_development.absence_slot_kinds ;;

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
    drill_fields: [id, group_absence_slot_kinds.count]
  }
}
