view: health_messages_monthly_activity {
  derived_table: {
    datagroup_trigger: messages_health
    sql: SELECT
          accounts.id as account_id
        -- , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', (CONVERT_TZ(TIMESTAMP(accounts.confirmed_at),'America/New_York','UTC'))) MONTH) as signup_month
        -- , DATE_FORMAT(DATE_FORMAT((CONVERT_TZ(TIMESTAMP(accounts.confirmed_at),'America/New_York','UTC')),'%Y-%m'),'%Y-%m') as signup_month
       -- , date_add(date_add(LAST_DAY(CONVERT_TZ(TIMESTAMP(accounts.confirmed_at),'America/New_York','UTC')),interval 1 DAY),interval -1 MONTH) as signup_month
       , DATE_SUB(CONVERT_TZ(TIMESTAMP(accounts.confirmed_at),'America/New_York','UTC'),INTERVAL DAYOFMONTH(CONVERT_TZ(TIMESTAMP(accounts.confirmed_at),'America/New_York','UTC'))-1 DAY) as signup_month
       , month_list.message_month as message_month
        , COALESCE(data_x.monthly_messages, 0) as monthly_messages
        ,(@row_number:=@row_number + 1) AS num
      FROM
       (SELECT @row_number:=0) AS t, accounts
      LEFT JOIN
        (
          SELECT
           DISTINCT(date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', m.action_date) MONTH)) as message_month
          FROM ${hlth_messaging_actions.SQL_TABLE_NAME} m
        ) as month_list
      ON month_list.message_month >= date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', (CONVERT_TZ(TIMESTAMP(accounts.confirmed_at),'America/New_York','UTC'))) MONTH)
      LEFT JOIN
        (
          SELECT
                m.account_id
              , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', m.action_date) MONTH) as message_month
              , COUNT(distinct m.id) AS monthly_messages
          FROM ${hlth_messaging_actions.SQL_TABLE_NAME} m
          GROUP BY 1,2
        ) as data_x
      ON data_x.message_month = month_list.message_month
      AND data_x.account_id = accounts.id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: signup {
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
    sql: ${TABLE}.signup_month ;;
    convert_tz: no
  }

  dimension: months_since_signup {
    type: number
    sql: TIMESTAMPDIFF(MONTH, ${TABLE}.signup_month, ${TABLE}.message_month) ;;
  }

  dimension: message_month {
    type: string
    sql: ${TABLE}.message_month ;;
  }

  dimension: monthly_messages {
    type: number
    sql: ${TABLE}.monthly_messages ;;
  }

  dimension: num {
    type: number
    sql: ${TABLE}.num ;;
  }

  measure: total_users {
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.first_name, accounts.last_name]
  }

  measure: total_active_users {
    type: count_distinct
    sql: ${account_id} ;;

    filters: {
      field: monthly_messages
      value: ">0"
    }
  }

  measure: percent_of_cohort_active {
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${total_active_users} / nullif(${total_users},0) ;;
    drill_fields: [account_id, accounts.first_name, accounts.last_name, accounts.simplified_kind, signup_month, accounts.confirmed_at, accounts.group_acronyms, monthly_messages]
  }
  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      accounts.id,
      accounts.first_name,
      accounts.last_name,
      accounts.simplified_kind,
      accounts.confirmed_at,
      accounts.group_acronyms,
      monthly_messages
    ]
  }
}
