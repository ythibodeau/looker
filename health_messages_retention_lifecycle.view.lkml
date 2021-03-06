view: health_messages_retention_lifecycle {
  derived_table: {
    datagroup_trigger: messages_health
    sql: SELECT pdt5.yearmonth as yearmonth
          , pdt5.account_id
          , pdt4.monthly_messages
          , pdt4.previous_message_month
        FROM ${year_month_accounts_light.SQL_TABLE_NAME} as pdt5
        INNER JOIN ${health_messages_previous_monthly_activity.SQL_TABLE_NAME} as pdt4
            on pdt5.mapc_key = pdt4.mapc_key

 ;;
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

  dimension: monthly_messages {
    type: number
    sql: ${TABLE}.monthly_messages ;;
  }

  dimension: previous_message_month {
    type: string
    sql: ${TABLE}.previous_message_month ;;
  }

  dimension: is_current {
    type: yesno
    sql: ${monthly_messages} > 0 and timestampdiff(MONTH, cast(concat(${previous_message_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) = 1 ;;
  }

  measure: current_count {
    type: count
    filters: {
      field: is_current
      value: "Yes"
    }
  }

#   dimension: is_sleeping {
#     type: yesno
#     sql: ${monthly_comments} = 0 and timestampdiff(MONTH, cast(concat(${previous_comment_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) >= 1 ;;
#   }

  dimension: is_sleeping {
    type: yesno
    sql: ${monthly_messages} = 0 and timestampdiff(MONTH, cast(concat(${previous_message_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) = 1 ;;
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
    sql: ${monthly_messages} > 0 and timestampdiff(MONTH, cast(concat(${previous_message_month}, '-01') as date), cast(concat(${yearmonth}, '-01') as date) ) > 1 ;;
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
    sql: ${monthly_messages} > 0 AND ${previous_message_month} IS NULL ;;
  }

  measure: new_count {
    type: count
    filters: {
      field: is_new
      value: "Yes"
    }
  }

  set: detail {
    fields: [yearmonth, account_id, monthly_messages, previous_message_month]
  }
}
