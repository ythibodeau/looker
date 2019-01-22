view: year_month_series {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select
       distinct extract(year_month from root_table.xdate) as yearmonth

       FROM


       (SELECT
       (@row_number:=@row_number + 1) AS num,
       xdate
              FROM (
                  SELECT curdate() - interval (a.a + (10 * b.a) + (100 * c.a) + (1000 * d.a) + (10000 * e.a)) day as xdate
                  FROM (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as a
                  CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as b
                  CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as c
                  CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as d
                  CROSS JOIN (select 0 as a union all select 1 union all select 2 union all select 3 union all select 4 union all select 5 union all select 6 union all select 7 union all select 8 union all select 9) as e
                   ) dates,  (SELECT @row_number:=0) AS t
              WHERE xdate >= '2010-04-01'
              ORDER BY xdate) root_table;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: yearmonth {
    type: number
    primary_key: yes
    sql: ${TABLE}.yearmonth ;;
  }

  set: detail {
    fields: [yearmonth]
  }
}
