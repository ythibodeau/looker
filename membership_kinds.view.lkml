view: membership_kinds {
  sql_table_name: petalmd.membership_kinds ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: mnemonic {
    type: string
    sql: ${TABLE}.mnemonic ;;
  }

  dimension: readable_mnemonic {
    label: "membership_kinds.mnemonic"
    type: string
    sql:

    CASE
      WHEN ${TABLE}.mnemonic = "normal" THEN "{{ _localization['membership_kinds.normal'] }}"
      WHEN ${TABLE}.mnemonic = "read_only" THEN "{{ _localization['membership_kinds.read_only'] }}"
      WHEN ${TABLE}.mnemonic = "occasional" THEN "{{ _localization['membership_kinds.occasional'] }}"
    END;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
