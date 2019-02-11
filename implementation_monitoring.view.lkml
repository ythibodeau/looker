view: implementation_monitoring {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql:  SELECT G.id,
                G.acronym,
                G.name,
                G.excluded,
                G.created_at,
                ASS_C.assignment_count,
                TASK_C.task_count,
                TASK_KIND_C.task_kind_count,
                MEM_C.membership_count,
                MEM_C.activated_count,
                HOL_C.holidays_count

FROM groups G

INNER JOIN (
                        SELECT G.id as group_id, COUNT(A.id) as assignment_count FROM groups G
                        INNER JOIN (
                                                SELECT G.id as group_id, MAX(P.id) as max_period_id FROM groups G
                                                LEFT JOIN sche__periods P ON P.group_id = G.id
                                                GROUP BY G.id
                                                 ) MAX_P ON MAX_P.group_id = G.id
                        LEFT JOIN sche__plans P ON P.period_id = MAX_P.max_period_id
                        LEFT JOIN sche__assignments A ON A.plan_id = P.id
                        GROUP BY G.id
                       ) ASS_C ON ASS_c.group_id = G.id
INNER JOIN (
                         SELECT G.id as group_id, COUNT(T.id) as task_count FROM groups G
                         INNER JOIN (
                                                  SELECT G.id as group_id, MAX(P.id) as max_period_id FROM groups G
                                                  LEFT JOIN sche__periods P ON P.group_id = G.id
                                                  GROUP BY G.id
                                                 ) MAX_P ON MAX_P.group_id = G.id
                        LEFT JOIN sche__tasks T ON T.period_id = MAX_P.max_period_id
                       GROUP BY G.id
                       ) TASK_C ON TASK_C.group_id = G.id
INNER JOIN (
                         SELECT G.id as group_id, COUNT(TK.id) as task_kind_count FROM groups G
                         INNER JOIN (
                                                  SELECT G.id as group_id, MAX(P.id) as max_period_id FROM groups G
                                                  LEFT JOIN sche__periods P ON P.group_id = G.id
                                                  GROUP BY G.id
                                                 ) MAX_P ON MAX_P.group_id = G.id
                        LEFT JOIN sche__task_kinds TK ON TK.period_id = MAX_P.max_period_id
                       GROUP BY G.id
                       ) TASK_KIND_C ON TASK_KIND_C.group_id = G.id
INNER JOIN (
                         SELECT G.id as group_id, COUNT(M.id) as membership_count, COUNT(CASE WHEN (M.activated = true) THEN M.id  ELSE NULL END) AS activated_count FROM groups G
                         LEFT JOIN memberships M ON M.group_id = G.id
                         GROUP BY G.id
                         ) MEM_C ON MEM_C.group_id = G.id
INNER JOIN (
                         SELECT G.id as group_id, COUNT(H.id) as holidays_count FROM groups G
                         LEFT JOIN holidays H ON H.group_id = G.id
                        GROUP BY G.id
                        ) HOL_C ON HOL_C.group_id = G.id
 WHERE G.implementation = 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
    }


  dimension: assignment_count {
    type: number
    sql: ${TABLE}.assignment_count ;;
  }

  dimension: task_count {
    type: number
    sql: ${TABLE}.task_count ;;
  }

  dimension: task_kind_count {
    type: number
    sql: ${TABLE}.task_kind_count ;;
  }

  dimension: membership_count {
    type: number
    sql: ${TABLE}.membership_count ;;
  }

  dimension: activated_count {
    type: number
    sql: ${TABLE}.activated_count ;;
  }

  dimension: holidays_count {
    type: number
    sql: ${TABLE}.holidays_count ;;
  }

  dimension: acronym {
    type: string
    sql: ${TABLE}.acronym ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: has_holidays {
    type: yesno
    sql: ${TABLE}.holidays_count > 0 ;;
  }

  dimension: has_task_kinds {
    type: yesno
    sql: ${TABLE}.task_kind_count > 0 ;;
  }

  dimension: has_tasks {
    type: yesno
    sql: ${TABLE}.task_count > 0 ;;
  }

  dimension: has_assignments {
    type: yesno
    sql: ${TABLE}.assignment_count > 0 ;;
  }

  dimension: created_at {
    type: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: excluded {
    type: yesno
    sql: ${TABLE}.excluded ;;
  }

  set: detail {
    fields: [id, assignment_count, task_count, membership_count, holidays_count]
  }
}
