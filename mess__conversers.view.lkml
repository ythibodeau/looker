view: mess__conversers {
  sql_table_name: petalmd.mess__conversers ;;

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

  dimension: admin {
    type: yesno
    sql: ${TABLE}.admin ;;
  }

  dimension: conversation_id {
    type: number
    sql: ${TABLE}.conversation_id ;;
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

  dimension: silenced {
    type: yesno
    sql: ${TABLE}.silenced ;;
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

  measure: count_distinct_accounts {
    label: "accounts"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      accounts.first_name,
      accounts.last_name,
      accounts.groups_acronym,
      accounts.institutions,
    ]
  }
}
