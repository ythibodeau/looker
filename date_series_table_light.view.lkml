view: date_series_table_light {
  derived_table: {
    sql: SELECT
 num,
 day_date,
 quarter_start_date,
 DATE_ADD(DATE_ADD(quarter_start_date, INTERVAL +3 MONTH), INTERVAL -1 SECOND) as quarter_end_date,
 LAST_DAY(day_date) as end_of_month
 FROM (
SELECT
  num,
  day_date,
  CAST(CONCAT(YEAR(day_date), CASE QUARTER(day_date)
  WHEN 1 THEN '-01-'
  WHEN 2 THEN '-04-'
  WHEN 3 THEN '-07-'
  WHEN 4 THEN '-10-'
  END,
  '-01T00:00:00') AS datetime) as quarter_start_date
  FROM (
    SELECT
     (@row_number:=@row_number + 1) AS num,
     day_date
            FROM (
                SELECT curdate() - interval (a.a + (10 * b.a) + (100 * c.a) + (1000 * d.a) + (10000 * e.a)) day as day_date
                FROM (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as a
                CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as b
                CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as c
                CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as d
                CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as e
                 ) dates,  (SELECT @row_number:=0) AS t
            WHERE day_date >= '2019-01-01'
    ) dates
  ) dates_with_quarter
ORDER BY day_date
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: num {
    type: number
    sql: ${TABLE}.num ;;
  }

  dimension_group: day_date {
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
    sql: ${TABLE}.day_date ;;
  }

  set: detail {
    fields: [num, day_date_date]
  }
}
