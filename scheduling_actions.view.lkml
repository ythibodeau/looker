view: scheduling_actions {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql:
      SELECT DISTINCT cr.initiated_by_id as account_id,
            'initiated_change_request' as action,
            DATE_FORMAT(cr.initiated_at, '%Y-%m-%d') as action_date
      FROM sche__change_requests cr
      WHERE YEAR(cr.created_at) >= 2019
      UNION
      SELECT DISTINCT cr.executed_by_id as account_id,
            'executed_change_request' as action,
            DATE_FORMAT(cr.executed_at, '%Y-%m-%d') as action_date
      FROM sche__change_requests cr
      WHERE YEAR(cr.created_at) >= 2019
      UNION
      SELECT DISTINCT cr.accepted_by_id as account_id,
            'accepted_change_request' as action,
            DATE_FORMAT(cr.accepted_at, '%Y-%m-%d') as action_date
      FROM sche__change_requests cr
      WHERE YEAR(cr.created_at) >= 2019
      UNION
      SELECT DISTINCT cr.approved_by_id as account_id,
            'approved_change_request' as action,
            DATE_FORMAT(cr.approved_at, '%Y-%m-%d') as action_date
      FROM sche__change_requests cr
      WHERE YEAR(cr.created_at) >= 2019
      UNION
      SELECT DISTINCT cr.cancelled_by_id as account_id,
            'cancelled_change_request' as action,
            DATE_FORMAT(cr.cancelled_at, '%Y-%m-%d') as action_date
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
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: unique_account {
    type: count_distinct
    sql: ${account_id} ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }


  dimension_group: action_date {
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
    sql: ${TABLE}.action_date ;;
  }

  set: detail {
    fields: [account_id, action]
  }
}
