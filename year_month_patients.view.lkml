view: year_month_patients {
  derived_table: {
    sql: SELECT
           distinct month_series.yearmonth,
           CONCAT(month_series.yearmonth, "-", CAST(pati__patients.id as CHAR)) as mapc_key
          , pati__patients.id as patient_id
              FROM ${year_month_table_patients.SQL_TABLE_NAME} as month_series
              CROSS JOIN pati__patients WHERE pati__patients.state = 3
              AND  month_series.yearmonth IS NOT NULL
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

  dimension: mapc_key {
    type: string
    sql: ${TABLE}.mapc_key ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  set: detail {
    fields: [yearmonth, mapc_key, patient_id]
  }
}
