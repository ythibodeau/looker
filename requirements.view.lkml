view: requirements {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT R.id,
       R.skill_id,
       R.task_id,
       R.minimum,
       R.maximum,
       DATE(CONVERT_TZ(R.created_at ,'UTC','America/New_York')) AS created_date,
       DATE(CONVERT_TZ(R.updated_at ,'UTC','America/New_York')) AS updated_date,
CASE WHEN minimum > 0 AND TK.restriction_kind_id = 2 AND NOT EXISTS (SELECT id FROM sche__assignments A WHERE A.requirement_id = R.id) THEN true     ELSE false
END AS coverage_break
FROM sche__requirements R
INNER JOIN sche__tasks T ON T.id = R.task_id
INNER JOIN sche__task_kinds TK ON TK.id = T.kind_id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: skill_id {
    type: number
    sql: ${TABLE}.skill_id ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: minimum {
    type: number
    sql: ${TABLE}.minimum ;;
  }

  dimension: maximum {
    type: number
    sql: ${TABLE}.maximum ;;
  }

  dimension: created_date {
    type: date
    sql: ${TABLE}.created_date ;;
    convert_tz: no
  }

  dimension: updated_date {
    type: date
    sql: ${TABLE}.updated_date ;;
    convert_tz: no
  }

  dimension: coverage_break {
    type: string
    sql:${TABLE}.coverage_break ;;
  }

  dimension: readable_coverage_break {
    type: string
    sql:
    CASE WHEN ${TABLE}.coverage_break = TRUE THEN "Bris de couverture"
    ELSE "Tâche couverte"
    END;;
  }

  set: detail {
    fields: [
      id,
      skill_id,
      task_id,
      minimum,
      maximum,
      created_date,
      updated_date,
      coverage_break
    ]
  }
}
