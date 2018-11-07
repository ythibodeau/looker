view: timezones {
  sql_table_name: petalmd_development.timezones ;;

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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      absences.count,
      accounts.count,
      admi__users.count,
      comm__documents.count,
      comm__dossiers.count,
      comm__links.count,
      groups.count,
      meeting_events.count,
      pati__patients.count,
      schedule_events.count,
      _change_requests.count
    ]
  }
}
