view: sche__console_layouts {
  sql_table_name: petalmd.sche__console_layouts ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: default {
    type: yesno
    sql: ${TABLE}.`default` ;;
  }

  dimension: display_account_contact_methods {
    type: yesno
    sql: ${TABLE}.display_account_contact_methods ;;
  }

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: public_visible {
    type: yesno
    sql: ${TABLE}.public_visible ;;
  }

  dimension: published {
    type: yesno
    sql: ${TABLE}.published ;;
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
    drill_fields: [id, name]
  }
}
