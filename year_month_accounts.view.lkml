view: year_month_accounts {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT    distinct month_series.yearmonth
          , accounts.id as account_id
        FROM ${year_month_table.SQL_TABLE_NAME} as month_series
        CROSS JOIN accounts
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: compound_primary_key {
    primary_key: yes
    type: string
    sql: CONCAT(${account_id}, ${yearmonth}) ;;
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  set: detail {
    fields: [yearmonth, account_id]
  }
}
