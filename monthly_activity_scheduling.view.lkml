view: monthly_activity_scheduling {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
          accounts.id as account_id
        , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', accounts.confirmed_at) MONTH) as signup_month
        , month_list.action_month as action_month
        , COALESCE(data_x.monthly_actions, 0) as monthly_actions
        ,(@row_number:=@row_number + 1) AS num
      FROM
       (SELECT @row_number:=0) AS t, accounts
      LEFT JOIN
        (
          SELECT
           DISTINCT(date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', sa.action_date) MONTH)) as action_month
          FROM ${scheduling_actions.SQL_TABLE_NAME} sa WHERE YEAR(sa.action_date) >= 2019
        ) as month_list
      ON month_list.action_month >= date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', accounts.confirmed_at) MONTH)
      LEFT JOIN
        (
          SELECT
                sa.account_id
              , date_add('1900-01-02', interval TIMESTAMPDIFF(MONTH, '1900-01-02', sa.action_date) MONTH) as action_month
              , COUNT(distinct sa.id) AS monthly_actions
          FROM ${scheduling_actions.SQL_TABLE_NAME} sa WHERE YEAR(sa.action_date) >= 2019
          GROUP BY 1,2
        ) as data_x
      ON data_x.action_month = month_list.action_month
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
    timeframes: [date, month]
    sql: ${TABLE}.signup_month ;;
  }

  dimension: action_month {
    type: string
    sql: ${TABLE}.action_month ;;
  }

  dimension: monthly_actions {
    type: number
    sql: ${TABLE}.monthly_actions ;;
  }

  dimension: num {
    type: number
    sql: ${TABLE}.num ;;
  }

  dimension: months_since_signup {
    type: number
    sql: TIMESTAMPDIFF(MONTH, ${TABLE}.signup_month, ${TABLE}.action_month) ;;
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
      field: monthly_actions
      value: ">0"
    }
  }

  measure: percent_of_cohort_active {
    type: number
    value_format_name: percent_1
    sql: 1.0 * ${total_active_users} / nullif(${total_users},0) ;;
    drill_fields: [account_id, accounts.first_name, accounts.last_name, account.simplified_kind, accounts.group_acronyms, monthly_actions]
  }


  set: detail {
    fields: [account_id, signup_month, action_month, monthly_actions, num]
  }
}
