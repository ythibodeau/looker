view: restriction_kinds {
  sql_table_name: petalmd.restriction_kinds ;;

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
    drill_fields: [id, absence_report_configs.count, schedule_events.count, _task_kinds.count]
  }
}