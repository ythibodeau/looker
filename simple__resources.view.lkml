view: simple__resources {
  sql_table_name: petalmd.simple__resources ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
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

  dimension: explicit_initials {
    type: string
    sql: ${TABLE}.explicit_initials ;;
  }

  dimension: explicit_last_name {
    type: string
    sql: ${TABLE}.explicit_last_name ;;
  }

  dimension: multi_selector_id {
    type: number
    sql: ${TABLE}.multi_selector_id ;;
  }

  dimension: schedule_configuration_id {
    type: number
    sql: ${TABLE}.schedule_configuration_id ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      explicit_last_name,
      accounts.id,
      accounts.username,
      accounts.first_name,
      accounts.middle_name,
      accounts.last_name
    ]
  }
}