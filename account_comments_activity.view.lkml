view: account_comments_activity {

  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select o1.account_id, max(o1.created_at) as latest_comment_date, max(o2.created_at) as previous_comment_date
      from comments o1
      join comments o2 on o1.account_id = o2.account_id
                    and extract(year_month from o1.created_at) > extract(year_month from o2.created_at)
      group by o1.account_id
      order by o1.account_id, latest_comment_date;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: latest_comment_date {
    type: time
    sql: ${TABLE}.latest_comment_date ;;
  }

  dimension_group: previous_comment_date {
    type: time
    sql: ${TABLE}.previous_comment_date ;;
  }

  set: detail {
    fields: [account_id, latest_comment_date_time, previous_comment_date_time]
  }
}
