view: scheduling_actions {
  derived_table: {
    indexes: ["account_id", "action_date"]
    sql_trigger_value: SELECT CURDATE() ;;
    sql:
       select (@row_number:=@row_number + 1) AS id,
       x.account_id as account_id,
       x.action as action,
       x.signup as signup,
       x.action_date as action_date
       FROM
       (SELECT @row_number:=0) AS t, (

      SELECT DISTINCT cr.initiated_by_id as account_id,
            'initiated_change_request' as action,
            a.confirmed_at as signup,
            DATE_FORMAT(cr.initiated_at, '%Y-%m-%d') as action_date
      FROM sche__change_requests cr
      INNER JOIN accounts a on cr.initiated_by_id = a.id
      WHERE YEAR(cr.created_at) >= 2019
      UNION
      SELECT DISTINCT cr.executed_by_id as account_id,
            'executed_change_request' as action,
            a.confirmed_at as signup,
            DATE_FORMAT(cr.executed_at, '%Y-%m-%d') as action_date
      FROM sche__change_requests cr
      INNER JOIN accounts a on cr.executed_by_id = a.id
      WHERE YEAR(cr.created_at) >= 2019
      UNION
      SELECT DISTINCT cr.accepted_by_id as account_id,
            'accepted_change_request' as action,
            a.confirmed_at as signup,
            DATE_FORMAT(cr.accepted_at, '%Y-%m-%d') as action_date
      FROM sche__change_requests cr
      INNER JOIN accounts a on cr.accepted_by_id = a.id
      WHERE YEAR(cr.created_at) >= 2019
      UNION
      SELECT DISTINCT cr.approved_by_id as account_id,
            'approved_change_request' as action,
            a.confirmed_at as signup,
            DATE_FORMAT(cr.approved_at, '%Y-%m-%d') as action_date
      FROM sche__change_requests cr
      INNER JOIN accounts a on cr.approved_by_id = a.id
      WHERE YEAR(cr.created_at) >= 2019
      UNION
      SELECT DISTINCT cr.cancelled_by_id as account_id,
            'cancelled_change_request' as action,
            a.confirmed_at as signup,
            DATE_FORMAT(cr.cancelled_at, '%Y-%m-%d') as action_date
      FROM sche__change_requests cr
      INNER JOIN accounts a on cr.cancelled_by_id = a.id
      WHERE YEAR(cr.created_at) >= 2019
      UNION
      select DISTINCT me.account_id as account_id,
             'created_event' as action,
             a.confirmed_at as signup,
             DATE_FORMAT(me.created_at, '%Y-%m-%d') as action_date
      FROM meeting_events me
      INNER JOIN accounts a on me.account_id = a.id
      WHERE YEAR(me.created_at) >= 2019
      UNION
      select DISTINCT ma.account_id as account_id,
             'answered_event' as action,
             a.confirmed_at as signup,
             DATE_FORMAT(ma.created_at, '%Y-%m-%d') as action_date
      FROM meeting_attendees ma
      INNER JOIN accounts a on ma.account_id = a.id
      WHERE YEAR(ma.created_at) >= 2019 AND ma.answer_id IN (2,3)
      -- UNION
      -- SELECT DISTINCT(ph.user_id) as account_id,
      --        CASE ph.source_type
         --       WHEN 1 THEN "period_step"
            --    WHEN 2 THEN "period_script"
      --          WHEN 3 THEN "period_wizard"
      --          WHEN 4 THEN "period_undo"
      --          WHEN 5 THEN "period_publish"
      --          WHEN 6 THEN "period_transfert"
      --        END AS action,
      --       ph.created_at as action_date
      --  FROM sche__period_histories ph
     --   WHERE ph.user_id IS NOT NULL
     --   AND YEAR(ph.created_at) >= 2019
      ) as x
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

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
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
    sql: ${TABLE}.signup ;;
    convert_tz: no
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
    convert_tz: no
  }


  set: detail {
    fields: [account_id, action]
  }
}
