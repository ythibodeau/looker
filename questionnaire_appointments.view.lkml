view: questionnaire_appointments {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT * FROM (
      select
      a.id, a.created_at as created_at, r.id as reason_id, g.id as group_id  from pati__appointments a
      INNER JOIN pati__availabilities av ON av.id = a.availability_id
      INNER JOIN pati__account_tasks ata on ata.id = av.account_task_id
      INNER JOIN pati__tasks t ON t.id = ata.task_id
      INNER JOIN accounts acc on acc.id = ata.account_id
      INNER JOIN pati__reasons r on r.id = t.reason_id
      INNER JOIN groups g on g.id = r.group_id
      where a.created_by_type = 'Patient::Patient'
      and r.id in (select distinct parent_id from pati__form_forms  ff where ff.visible_to_users = 1)
      and a.cancelled = 0
      ) A
      WHERE EXISTS (SELECT * FROM pati__form_forms WHERE parent_id = A.reason_id AND A.created_at > created_at );
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

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: reason_id {
    type: number
    sql: ${TABLE}.reason_id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  set: detail {
    fields: [id, created_at_time, reason_id, group_id]
  }
}
