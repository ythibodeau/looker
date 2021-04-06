view: absence_report_config_templates {
  sql_table_name: petalmd.absence_report_config_templates ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: group_with_night_slot {
    type: yesno
    sql: ${TABLE}.group_with_night_slot ;;
  }

  dimension: mnemonic {
    type: string
    sql: ${TABLE}.mnemonic ;;
  }

  dimension: option_id {
    type: number
    sql: ${TABLE}.option_id ;;
  }

  dimension: preference_excluded {
    type: yesno
    sql: ${TABLE}.preference_excluded ;;
  }

  dimension: preference_only {
    type: yesno
    sql: ${TABLE}.preference_only ;;
  }

  dimension: raw_cwdays {
    type: string
    sql: ${TABLE}.raw_cwdays ;;
  }

  dimension: unit_combination_id {
    type: number
    sql: ${TABLE}.unit_combination_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}