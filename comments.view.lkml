view: comments {
  sql_table_name: petalmd_development.comments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: discussion_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.discussion_id ;;
  }

  dimension: draft {
    type: yesno
    sql: ${TABLE}.draft ;;
  }

  dimension: email_message_id {
    type: string
    sql: ${TABLE}.email_message_id ;;
  }

  dimension: link_id {
    type: number
    sql: ${TABLE}.link_id ;;
  }

  dimension: support_user_id {
    type: number
    sql: ${TABLE}.support_user_id ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: is_regular {
    type: yesno
    sql: ${discussions.topic_type} IS NULL ;;
  }

  dimension: is_change_request {
    type: yesno
    sql: ${discussions.topic_type} = "Schedule::ChangeRequest" ;;
  }

  dimension: message_comment {
    type: yesno
  }

  dimension: is_last_30_days {
    type: yesno
    sql: ${created_date} BETWEEN CURDATE() - INTERVAL 30 DAY AND CURDATE()  ;;
  }

  dimension: created_week_only {
    type: date
    sql: YEARWEEK(${created_date});;
 }

  dimension: created_month_only {
    type: number
    sql: MONTH(${created_date});;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: regular_count {
    label: "Regular Count"
    type: count
    filters: {
      field: is_regular
      value: "Yes"
    }
  }

  measure: number_of_unique_accounts {
    type: count_distinct
    sql: ${account_id} ;;
  }

  measure: change_request_count {
    label: "Change Request Count"
    type: count
    filters: {
      field: is_change_request
      value: "Yes"
    }
  }

  measure: dau {
    label: "DAU"
    description: "daily active users..."
    type: count_distinct
    sql: ${account_id} ;;
    filters: {
      field: is_active_user
      value: "Yes"
    }
  }

  dimension: is_active_user {
    type: yesno
    sql: ${discussions.topic_type} is null ;;
  }

  measure: count_is_last_30_days {
    type: count
    filters: {
      field: is_last_30_days
      value: "Yes"
    }
    filters: {
      field: is_regular
      value: "Yes"
    }
  }

  # CURRENT if Yes
  # SLEEPING if No
  dimension: current {
    type: yesno
    sql: ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE ${created_month} = ${year_month_table.year_month})
         AND
         ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE TIMESTAMPDIFF(MONTH, ${year_month_table.year_month}, ${created_month}) = 1) ;;
  }

  dimension: sleeping {
    type: yesno
    sql: ${account_id} NOT IN (SELECT ${account_id} FROM ${TABLE} WHERE ${created_month} = ${year_month_table.year_month})
         AND
         ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE TIMESTAMPDIFF(MONTH, ${year_month_table.year_month}, ${created_month}) >= 1) ;;
  }

  # resuscitated if Yes
  dimension: resuscitated {
    type: yesno
    sql: ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE ${created_month} = ${year_month_table.year_month})
    AND
    ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE TIMESTAMPDIFF(MONTH, ${year_month_table.year_month}, ${created_month}) > 1) ;;
  }

  dimension: new {
    type: yesno
    sql: ${account_id} IN (SELECT ${account_id} FROM ${TABLE} WHERE ${created_month} = ${year_month_table.year_month})
         AND
         ${account_id} NOT IN (SELECT ${account_id} FROM ${TABLE} WHERE TIMESTAMPDIFF(MONTH, ${year_month_table.year_month}, ${created_month}) >= 1) ;;
  }

  measure: current_total {
    type: count
    filters: {
      field: current
      value: "Yes"
    }
  }

  measure: sleeping_total {
    type: count
    filters: {
      field: sleeping
      value: "Yes"
    }
  }

  measure: resuscitated_total {
    type: count
    filters: {
      field: resuscitated
      value: "yes"
    }
  }

  measure: new_total {
    type: count
    filters: {
      field: new
      value: "yes"
    }
  }

  measure: classification  {
    type: number
    sql: ${regular_count} ;;
    html:     {% if value > 50 %}
      <font color="goldenrod">"Gold"</font>
    {% elsif value > 20 %}
      <font color="grey">"Silver"</font>
    {% else %}
      <font color="brown">"Bronze"</font>
    {% endif %}
 ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      discussions.id,
      accounts.id,
      accounts.username,
      accounts.first_name,
      accounts.middle_name,
      accounts.last_name
    ]
  }
}
