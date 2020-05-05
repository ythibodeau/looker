view: month_series_table {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT MIN(day_date) as start_time, end_of_month as end_time FROM ${date_series_table.SQL_TABLE_NAME} GROUP BY end_of_month;
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: start_time {
    type: date
    sql: ${TABLE}.start_time ;;
    convert_tz: no
  }

  dimension: end_time {
    type: date
    sql: ${TABLE}.end_time ;;
    convert_tz: no
  }

  set: detail {
    fields: [start_time, end_time]
  }
}
