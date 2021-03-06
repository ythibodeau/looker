view: account_kinds {
  sql_table_name: petalmd.account_kinds ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: mnemonic {
    type: string
    sql: ${TABLE}.mnemonic ;;
  }

  dimension: simplified_mnemonic {
    type: string
    sql:

    CASE
      WHEN ${TABLE}.mnemonic IN ("doctor", "retired", "fellow") THEN  "{{ _localization['doctor'] }}"
      WHEN ${TABLE}.mnemonic IN ("resident1", "resident2", "resident3", "resident4", "resident5", "resident6", "resident7") THEN  "{{ _localization['resident'] }}"
      WHEN ${TABLE}.mnemonic = "other_health_professional" THEN "HCP"
      WHEN ${TABLE}.mnemonic IN ("assistant" , "administrator") THEN "Assistant/Admin"
      WHEN ${TABLE}.mnemonic = "maccs" THEN "MACCS"
      ELSE "Other"
    END;;
  }

  dimension: hub_mnemonic {
    type: string
    sql:
    CASE
       WHEN ${TABLE}.mnemonic IN ("doctor", "retired", "fellow") THEN  "{{ _localization['doctor'] }}"
       WHEN ${TABLE}.mnemonic IN ("resident1", "resident2", "resident3", "resident4", "resident5", "resident6", "resident7") THEN  "{{ _localization['resident'] }}"
       WHEN ${TABLE}.mnemonic = "generic_doctor" THEN "MD Générique"
       WHEN ${TABLE}.mnemonic = "nurse_practitioner" THEN "IPS"
       WHEN ${TABLE}.mnemonic = "social_worker" THEN "Travailleur social"
       ELSE "Autre"
    END

    ;;
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
    sql: ${TABLE}.mnemonic IN ("other_health_professional")  ;;
  }

  dimension: is_assistant {
    type: yesno
    sql: ${TABLE}.mnemonic IN ("assistant" , "administrator")  ;;
  }


  # Account Kind Mixin values

  measure: count {
    type: count
    drill_fields: [id, account_kind_distribution_lists.count]
  }

  measure: doctor_count {
    type: count
    filters: {
      field: simplified_mnemonic
      value: "Doctor"
    }
  }

  measure: resident_count {
    type: count
    filters: {
      field: simplified_mnemonic
      value: "Resident"
    }
  }

  measure: hcp_count {
    type: count
    filters: {
      field: simplified_mnemonic
      value: "HCP"
    }
  }

  measure: assistant_count {
    type: count
    filters: {
      field: simplified_mnemonic
      value: "Assistant/Admin"
    }
  }

  measure: other_count {
    type: count
    filters: {
      field: simplified_mnemonic
      value: "Other"
    }
  }
}
