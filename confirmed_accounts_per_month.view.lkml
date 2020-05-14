view: confirmed_accounts_per_month {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT DATE_FORMAT(accounts.confirmed_at, '%Y-%m') month,
      count(distinct accounts.id) confirmed_accounts
      from accounts where accounts.confirmed_at is not null group by DATE_FORMAT(accounts.confirmed_at, '%Y-%m')
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
    convert_tz: no
  }

  dimension: confirmed_accounts {
    type: number
    sql: ${TABLE}.confirmed_accounts ;;
  }

  set: detail {
    fields: [month, confirmed_accounts]
  }
}
