view: year_month_accounts {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    indexes: ["mapc_key"]
    sql: SELECT
     distinct month_series.yearmonth,
     CONCAT(month_series.yearmonth, "-", CAST(accounts.id as CHAR)) as mapc_key
    , accounts.id as account_id
        FROM ${year_month_table.SQL_TABLE_NAME} as month_series
        CROSS JOIN accounts
        WHERE  month_series.yearmonth IS NOT NULL
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: mapc_key {
    primary_key: yes
    type: string
    sql:  ${TABLE}.mapc_key;;
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
