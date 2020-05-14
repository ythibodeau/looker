view: cumulative_confirmed_accounts {
  derived_table: {
    sql: SELECT t.month,
       t.confirmed_accounts,
       @running_total:=@running_total + t.confirmed_accounts AS cumulative_sum
FROM
(SELECT DATE_FORMAT(accounts.confirmed_at, '%Y-%m') month,
      count(distinct accounts.id) confirmed_accounts
      from accounts where accounts.confirmed_at is not null group by DATE_FORMAT(accounts.confirmed_at, '%Y-%m')) t
      JOIN (SELECT @running_total:=0) r
ORDER BY t.month;
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: month {
    type: string
    sql: ${TABLE}.month ;;
    convert_tz: no
  }

  dimension: confirmed_accounts {
    type: number
    sql: ${TABLE}.confirmed_accounts ;;
  }

  dimension: cumulative_sum {
    type: number
    sql: ${TABLE}.cumulative_sum ;;
  }

  set: detail {
    fields: [month, confirmed_accounts, cumulative_sum]
  }
}
