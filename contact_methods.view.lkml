view: contact_methods {
  sql_table_name: petalmd.contact_methods ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: console_enabled {
    type: yesno
    sql: ${TABLE}.console_enabled ;;
  }

  dimension: contactable_id {
    type: number
    sql: ${TABLE}.contactable_id ;;
  }

  dimension: contactable_type {
    type: string
    sql: ${TABLE}.contactable_type ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: extended_groups_shared {
    type: yesno
    sql: ${TABLE}.extended_groups_shared ;;
  }

  dimension: extra_information {
    type: string
    sql: ${TABLE}.extra_information ;;
  }

  dimension: hospital_id {
    type: number
    sql: ${TABLE}.hospital_id ;;
  }

  dimension: kind {
    type: number
    sql: ${TABLE}.kind ;;
  }

  dimension: clean_kind {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.kind = 1 THEN "Work"
      WHEN ${TABLE}.kind = 2 THEN "Mobile"
      WHEN ${TABLE}.kind = 3 THEN "Pager"
      WHEN ${TABLE}.kind = 4 THEN "Home"
      WHEN ${TABLE}.kind = 5 THEN "Code Pager"
      WHEN ${TABLE}.kind = 6 THEN "Fax"
      WHEN ${TABLE}.kind = 7 THEN "Pharmacy"
      WHEN ${TABLE}.kind = 8 THEN "Other"
      WHEN ${TABLE}.kind = 9 THEN "Speed Dial"
    END;;
  }

  dimension: managed_by_admin {
    type: yesno
    sql: ${TABLE}.managed_by_admin ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: oncall_list_number {
    type: yesno
    sql: ${TABLE}.oncall_list_number ;;
  }

  dimension: public_visible {
    type: yesno
    sql: ${TABLE}.public_visible ;;
  }

  dimension: visibility {
    type: number
    sql: ${TABLE}.visibility ;;
  }

  dimension: kind_number {
    type: string
    sql: CONCAT("(", ${clean_kind},") ", ${number}) ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
