view: year_month_table_patients {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql:
      SELECT distinct DATE_FORMAT(date, "%Y-%m") as yearmonth
      FROM ${date_series_table_patients.SQL_TABLE_NAME};
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: year_month {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  set: detail {
    fields: [year_month]
  }
}
