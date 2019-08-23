view: date_series_quarters {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT DISTINCT MAKEDATE(YEAR(date), 1) + INTERVAL QUARTER(date) QUARTER - INTERVAL 1 Quarter as quarter_start_date from  ${date_series_table.SQL_TABLE_NAME};
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: quarter_start_date {
    type: date
    label: "Quarter Start Date"
    sql: ${TABLE}.quarter_start_date ;;
  }

  set: detail {
    fields: [quarter_start_date]
  }
}
