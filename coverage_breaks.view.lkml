view: coverage_breaks {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
        sche__requirements.id  AS `.id`,
        DATE(CONVERT_TZ(sche__requirements.created_at ,'UTC','America/New_York')) AS `created_date`,
        sche__requirements.maximum  AS `maximum`,
        sche__requirements.minimum  AS `minimum`,
        sche__requirements.skill_id  AS `skill_id`,
        sche__requirements.task_id  AS `task_id`,
        DATE(CONVERT_TZ(sche__requirements.updated_at ,'UTC','America/New_York')) AS `updated_date`
      FROM petalmd.sche__requirements  AS sche__requirements
      LEFT JOIN petalmd.sche__assignments  AS sche__assignments ON sche__requirements.id = sche__assignments.requirement_id
      LEFT JOIN petalmd.sche__tasks  AS sche__tasks ON sche__requirements.task_id = sche__tasks.id
      LEFT JOIN petalmd.sche__task_kinds  AS sche__task_kinds ON sche__tasks.kind_id = sche__task_kinds.id

      WHERE (sche__requirements.minimum  >= 1) AND (sche__assignments.requirement_id  IS NULL) AND (sche__task_kinds.restriction_kind_id  = 2)
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: coverage_break {
    type: string
    sql: "Coverage Break" ;;
  }

  dimension: _id {
    type: number
    sql: ${TABLE}.`.id` ;;
  }

  dimension: created_date {
    type: date
    sql: ${TABLE}.created_date ;;
  }

  dimension: maximum {
    type: number
    sql: ${TABLE}.maximum ;;
  }

  dimension: minimum {
    type: number
    sql: ${TABLE}.minimum ;;
  }

  dimension: skill_id {
    type: number
    sql: ${TABLE}.skill_id ;;
  }

  dimension: task_id {
    type: number
    sql: ${TABLE}.task_id ;;
  }

  dimension: updated_date {
    type: date
    sql: ${TABLE}.updated_date ;;
  }

  set: detail {
    fields: [
      _id,
      created_date,
      maximum,
      minimum,
      skill_id,
      task_id,
      updated_date
    ]
  }
}
