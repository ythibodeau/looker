view: chats_retention_lifecycle {
 derived_table: {
  sql_trigger_value: SELECT CURDATE() ;;
  sql: SELECT pdt5.yearmonth as yearmonth
          , pdt5.account_id
          , pdt4.monthly_chats
          , pdt4.previous_chat_month
        FROM ${year_month_accounts.SQL_TABLE_NAME} as pdt5
        LEFT OUTER JOIN ${chat_previous_monthly_activity.SQL_TABLE_NAME} as pdt4
            on pdt5.mapc_key = pdt4.mapc_key  ;;
 }

measure: count {
  type: count
  drill_fields: [detail*]
}

dimension: lifecycle_key {
  primary_key: yes
  type: string
  sql: CONCAT( CAST(${account_id} as CHAR), ${yearmonth}) ;;
}

dimension: yearmonth {
  type: string
  sql: ${TABLE}.yearmonth ;;
}

dimension: the_date {
  type: date
  sql: STR_TO_DATE(${yearmonth}, "%Y-%m") ;;
}

dimension: account_id {
  type: number
  sql: ${TABLE}.account_id ;;
}

dimension: monthly_chats {
  type: number
  sql: ${TABLE}.monthly_chats ;;
}

dimension: previous_chat_month {
  type: string
  sql: ${TABLE}.previous_chat_month ;;
}

dimension: is_current {
  type: yesno
  sql: ${monthly_chats} > 0 and timestampdiff(MONTH, cast(concat(${previous_chat_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) = 1 ;;
}

measure: current_count {
  type: count
  filters: {
    field: is_current
    value: "Yes"
  }
}

dimension: is_sleeping {
  type: yesno
  sql: ${monthly_chats} = 0 and timestampdiff(MONTH, cast(concat(${previous_chat_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) = 1 ;;
}

measure: sleeping_count {
  type: count
  filters: {
    field: is_sleeping
    value: "Yes"
  }
}

dimension: is_resuscitated {
  type: yesno
  sql: ${monthly_chats} > 0 and timestampdiff(MONTH, cast(concat(${previous_chat_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) > 1 ;;
}

measure: resuscitated_count {
  type: count
  filters: {
    field: is_resuscitated
    value: "Yes"
  }
}

dimension: is_new {
  type: yesno
  sql: ${monthly_chats} > 0 AND ${previous_chat_month} IS NULL ;;
}

measure: new_count {
  type: count
  filters: {
    field: is_new
    value: "Yes"
  }
}

set: detail {
  fields: [yearmonth, account_id, monthly_chats, previous_comment_month]
}

}
