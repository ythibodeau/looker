view: date_series_table {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    indexes: ["day_date"]
    sql:
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
        WHERE day_date >= '2010-04-01'
        ORDER BY day_date;
               ;;
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

  dimension: week {
    type: date_week
    sql: ${TABLE}.day_date ;;
  }


  measure: count {
    type: count
  }

}
