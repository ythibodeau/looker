view: year_month_table_light {
  derived_table: {
    datagroup_trigger: messages_health
    sql: SELECT distinct DATE_FORMAT(day_date, "%Y-%m") as yearmonth
      FROM ${date_series_table.SQL_TABLE_NAME} where day_date > "2019-01-01"
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: yearmonth {
    type: string
    sql: ${TABLE}.yearmonth ;;
  }

  set: detail {
    fields: [yearmonth]
  }
}
