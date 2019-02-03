view: account_kinds {
  sql_table_name: petalmd_development.account_kinds ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: mnemonic {
    type: string
    sql: ${TABLE}.mnemonic ;;
  }

  # Account Kind Mixin values
  dimension: is_doctor {
    type: yesno
    sql: ${TABLE}.mnemonic IN ("doctor", "retired", "fellow")  ;;
  }

  dimension: is_resident {
    type: yesno
    sql: ${TABLE}.mnemonic IN ("resident1", "resident2", "resident3", "resident4", "resident5", "resident6", "resident7")  ;;
  }

  dimension: is_hcp {
    type: yesno
    sql: ${TABLE}.mnemonic IN ("doctor", "retired", "fellow")  ;;
  }

  dimension: is_assistant {
    type: yesno
    sql: ${TABLE}.mnemonic IN ("other_health_professional")  ;;
  }


  # Account Kind Mixin values

  measure: count {
    type: count
    drill_fields: [id, account_kind_distribution_lists.count]
  }
}
