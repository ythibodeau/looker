view: accounts_subspecialties {
  sql_table_name: petalmd_development.accounts_subspecialties ;;

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

  dimension: subspecialty_id {
    type: number
    sql: ${TABLE}.subspecialty_id ;;
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
    drill_fields: [accounts.id, accounts.username, accounts.first_name, accounts.middle_name, accounts.last_name]
  }
}
