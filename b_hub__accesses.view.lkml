view: b_hub__accesses {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select rfd.id as id,
       rfd.created_at as created_at,
       rfd.hin as hin,
       "not_redirected" as redirection,
       "orphan" as patient_status
from ${b_hub__log_ramq_family_doctors.SQL_TABLE_NAME} rfd
WHERE rfd.establishment_number IS NULL
UNION
select rfd.id as id,
rfd.created_at as created_at,
       rfd.hin as hin,
       "not_redirected" as redirection,
       "gmf_hub_managed" as patient_status
from ${b_hub__log_ramq_family_doctors.SQL_TABLE_NAME} rfd
INNER JOIN ${b_hub__clinics.SQL_TABLE_NAME} hc on hc.ramq_id = rfd.establishment_number
WHERE rfd.start_time <= hc.go_live_date
UNION
select rfd.id as id,
rfd.created_at as created_at,
       rfd.hin as hin,
       "redirected" as redirection,
       "gmf_not_hub_managed" as patient_status
 from ${b_hub__log_ramq_family_doctors.SQL_TABLE_NAME} rfd
 LEFT JOIN ${b_hub__clinics.SQL_TABLE_NAME} hc on hc.ramq_id = rfd.establishment_number
 WHERE rfd.establishment_number IS NOT NULL AND hc.ramq_id is NULL
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: redirected_hin_count {
    type: count_distinct
    sql: ${TABLE}.hin ;;
    filters: [redirection: "redirected"]
  }

  measure: not_redirected_hin_count {
    type: count_distinct
    sql: ${TABLE}.hin ;;
    filters: [redirection: "not_redirected"]
  }

  measure: unique_hin_count {
    type: count_distinct
    sql: ${TABLE}.hin ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: hin {
    type: string
    sql: ${TABLE}.hin ;;
  }

  dimension: redirection {
    type: string
    sql: ${TABLE}.redirection ;;
  }

  dimension: patient_status {
    type: string
    sql: ${TABLE}.patient_status ;;
  }


  set: detail {
    fields: [id, created_at_time, hin, redirection, patient_status]
  }
}
