view: health_booking_monthly_activity {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
          accounts.id as account_id
       , DATE_SUB(CONVERT_TZ(TIMESTAMP(accounts.confirmed_at),'America/New_York','UTC'),INTERVAL DAYOFMONTH(CONVERT_TZ(TIMESTAMP(accounts.confirmed_at),'America/New_York','UTC'))-1 DAY) as signup_month
       , month_list.booking_action_month as booking_action_month
        , COALESCE(data_x.monthly_actions, 0) as monthly_actions
        ,(@row_number:=@row_number + 1) AS num
      FROM
       (SELECT @row_number:=0) AS t, accounts
      LEFT JOIN
        (
          SELECT
           DISTINCT(date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', m.action_date) MONTH)) as booking_action_month
          FROM ${booking_actions.SQL_TABLE_NAME} m
        ) as month_list
      ON month_list.booking_action_month >= date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', (CONVERT_TZ(TIMESTAMP(accounts.confirmed_at),'America/New_York','UTC'))) MONTH)
      LEFT JOIN
        (
          SELECT
                m.account_id
              , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', m.action_date) MONTH) as booking_action_month
              , COUNT(distinct m.id) AS monthly_actions
          FROM ${booking_actions.SQL_TABLE_NAME} m
          GROUP BY 1,2
        ) as data_x
      ON data_x.booking_action_month = month_list.booking_action_month
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

  dimension: booking_action_month {
    type: string
    sql: ${TABLE}.booking_action_month ;;
  }

  dimension: monthly_actions {
    type: number
    sql: ${TABLE}.monthly_actions ;;
  }

  dimension: months_since_signup {
    type: number
    sql: TIMESTAMPDIFF(MONTH, ${TABLE}.signup_month, ${TABLE}.booking_action_month) ;;
  }

  dimension: num {
    type: number
    sql: ${TABLE}.num ;;
  }

  measure: total_users {
    type: count_distinct
    sql: ${accounts.id} ;;
    drill_fields: [accounts.id, accounts.first_name, accounts.last_name]
  }

  measure: total_active_users {
    type: count_distinct
    sql: ${account_id} ;;

    filters: {
      field: monthly_actions
      value: ">0"
    }
  }

  measure: percent_of_cohort_active {
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${total_active_users} / nullif(${total_users},0) ;;
    drill_fields: [account_id, accounts.first_name, accounts.last_name, accounts.simplified_kind, signup_month, accounts.confirmed_at, accounts.group_acronyms, monthly_actions]
  }

  set: detail {
    fields: [account_id, signup_month, booking_action_month, monthly_actions, num]
  }
}
