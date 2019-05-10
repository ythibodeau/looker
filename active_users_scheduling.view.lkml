view: active_users_scheduling {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT daily_use.account_id,
      wd.date as xdate,
      MIN(DATEDIFF(wd.date, daily_use.action_date)) as days_since_last_action
FROM ${date_series_table.SQL_TABLE_NAME} as wd
LEFT JOIN
(
-- Define Action Here --
SELECT DISTINCT cr.initiated_by_id as account_id,
      'initiated_change_request' as action,
      DATE_FORMAT(cr.created_at, '%Y-%m-%d') as action_date
FROM sche__change_requests cr
WHERE YEAR(cr.created_at) >= 2019
UNION
SELECT DISTINCT cr.executed_by_id as account_id,
      'executed_change_request' as action,
      DATE_FORMAT(cr.created_at, '%Y-%m-%d') as action_date
FROM sche__change_requests cr
WHERE YEAR(cr.created_at) >= 2019
UNION
SELECT DISTINCT cr.accepted_by_id as account_id,
      'accepted_change_request' as action,
      DATE_FORMAT(cr.created_at, '%Y-%m-%d') as action_date
FROM sche__change_requests cr
WHERE YEAR(cr.created_at) >= 2019
UNION
SELECT DISTINCT cr.approved_by_id as account_id,
      'approved_change_request' as action,
      DATE_FORMAT(cr.created_at, '%Y-%m-%d') as action_date
FROM sche__change_requests cr
WHERE YEAR(cr.created_at) >= 2019
UNION
SELECT DISTINCT cr.cancelled_by_id as account_id,
      'cancelled_change_request' as action,
      DATE_FORMAT(cr.created_at, '%Y-%m-%d') as action_date
FROM sche__change_requests cr
WHERE YEAR(cr.created_at) >= 2019
UNION
select DISTINCT me.account_id as account_id,
       'created_event' as action,
       DATE_FORMAT(me.created_at, '%Y-%m-%d') as action_date
FROM meeting_events me
WHERE YEAR(me.created_at) >= 2019
UNION
select DISTINCT ma.account_id as account_id,
       'accepted_event' as action,
       DATE_FORMAT(ma.created_at, '%Y-%m-%d') as action_date
FROM meeting_attendees ma
WHERE YEAR(ma.created_at) >= 2019 AND ma.answer_id IN (2,3)
) as daily_use
-- Define Action Here --

-- Define Date --
ON wd.date BETWEEN daily_use.action_date AND DATE_ADD(daily_use.action_date, INTERVAL 30 DAY)
-- Define Date --

GROUP BY 1,2;
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

  dimension: xdate {
    type: date
    sql: ${TABLE}.xdate ;;
  }

  dimension: active_this_day {
    type: yesno
    sql: ${days_since_last_action} <  1 ;;
  }

  dimension: active_last_7_days {
    type: yesno
    sql: ${days_since_last_action} < 7 ;;
  }

  dimension: days_since_last_action {
    type: number
    sql: ${TABLE}.days_since_last_action ;;
  }

  measure: user_count_active_30_days {
    label: "Monthly Active Users"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.name]
  }

  measure: user_count_active_this_day {
    label: "Daily Active Users"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.name]

    filters: {
      field: active_this_day
      value: "yes"
    }
  }

  measure: user_count_active_7_days {
    label: "Weekly Active Users"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [accounts.id, accounts.name]

    filters: {
      field: active_last_7_days
      value: "yes"
    }
  }

  set: detail {
    fields: [account_id, xdate, days_since_last_action]
  }
}
