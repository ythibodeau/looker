view: date_series_quarters {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT DISTINCT CONVERT_TZ(MAKEDATE(YEAR(date), 1) + INTERVAL QUARTER(date) QUARTER - INTERVAL 1 Quarter ,'America/New_York', 'UTC') as quarter_start_date from ${date_series_table.SQL_TABLE_NAME};
      ;;
  }

  dimension_group: quarter_start_date {
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
    label: "Quarter Start Date"
    sql: ${TABLE}.quarter_start_date ;;
  }
}
