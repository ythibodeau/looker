view: account_contact_methods {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select * from contact_methods where contactable_type = 'Account';
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: contactable_id {
    type: number
    sql: ${TABLE}.contactable_id ;;
  }

  dimension: kind {
    type: number
    sql: ${TABLE}.kind ;;
  }

  dimension: number {
    type: string
    sql: ${TABLE}.number ;;
  }

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: oncall_list_number {
    type: string
    sql: ${TABLE}.oncall_list_number ;;
  }

  dimension: extended_groups_shared {
    type: string
    sql: ${TABLE}.extended_groups_shared ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: updated_at {
    type: time
    sql: ${TABLE}.updated_at ;;
  }

  dimension: console_enabled {
    type: string
    sql: ${TABLE}.console_enabled ;;
  }

  dimension: contactable_type {
    type: string
    sql: ${TABLE}.contactable_type ;;
  }

  dimension: managed_by_admin {
    type: string
    sql: ${TABLE}.managed_by_admin ;;
  }

  dimension: extra_information {
    type: string
    sql: ${TABLE}.extra_information ;;
  }

  dimension: hospital_id {
    type: number
    sql: ${TABLE}.hospital_id ;;
  }

  dimension: public_visible {
    type: string
    sql: ${TABLE}.public_visible ;;
  }

  dimension: extension {
    type: string
    sql: ${TABLE}.extension ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}.country_code ;;
  }

  dimension: visibility {
    type: number
    sql: ${TABLE}.visibility ;;
  }

  set: detail {
    fields: [
      id,
      contactable_id,
      kind,
      number,
      display_sequence,
      oncall_list_number,
      extended_groups_shared,
      created_at_time,
      updated_at_time,
      console_enabled,
      contactable_type,
      managed_by_admin,
      extra_information,
      hospital_id,
      public_visible,
      extension,
      country_code,
      visibility
    ]
  }
}
