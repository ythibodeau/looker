view: b_hub__accesses {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select rfd.id as id,
       CONVERT_TZ(TIMESTAMP(rfd.created_at),'America/New_York','UTC') as created_at,
       rfd.hin as hin,
       rfd.patient_id as patient_id,
       rfd.establishment_number as ramq_establishment_id,
       rfd.start_time as start_date,
       rfd.professional_number as professional_number,
       "not_redirected" as redirection,
       "orphan" as patient_status
from ${b_hub__log_ramq_family_doctors.SQL_TABLE_NAME} rfd
WHERE rfd.establishment_number IS NULL
UNION
select rfd.id as id,
       CONVERT_TZ(TIMESTAMP(rfd.created_at),'America/New_York','UTC') as created_at,
       rfd.hin as hin,
       rfd.patient_id as patient_id,
       rfd.establishment_number as ramq_establishment_id,
       rfd.start_time as start_date,
       rfd.professional_number as professional_number,
       "not_redirected" as redirection,
       "gmf_hub_managed" as patient_status
from ${b_hub__log_ramq_family_doctors.SQL_TABLE_NAME} rfd
INNER JOIN ${b_hub__clinics.SQL_TABLE_NAME} hc on hc.ramq_id = rfd.establishment_number
WHERE rfd.start_time <= hc.go_live_date
UNION
select rfd.id as id,
       CONVERT_TZ(TIMESTAMP(rfd.created_at),'America/New_York','UTC') as created_at,
       rfd.hin as hin,
       rfd.patient_id as patient_id,
      rfd.establishment_number as ramq_establishment_id,
       rfd.start_time as start_date,
       rfd.professional_number as professional_number,
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
    label: "Redirections"
    type: count_distinct
    sql: ${TABLE}.hin ;;
    filters: [redirection: "redirected"]
  }

  measure: not_redirected_hin_count {
    label: "Accès RVSQ 2.0"
    type: count_distinct
    sql: ${TABLE}.hin ;;
    filters: [redirection: "not_redirected"]
  }

  measure: unique_hin_count {
    label: "Accès totaux"
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

  dimension: weekday {
    type: string
    sql:
    CASE
      WHEN DAYOFWEEK(CONVERT_TZ(TIMESTAMP(${TABLE}.created_at),'America/New_York','UTC')) = 1 THEN "Sunday"
      WHEN DAYOFWEEK(CONVERT_TZ(TIMESTAMP(${TABLE}.created_at),'America/New_York','UTC')) = 2 THEN "Monday"
      WHEN DAYOFWEEK(CONVERT_TZ(TIMESTAMP(${TABLE}.created_at),'America/New_York','UTC')) = 3 THEN "Tuesday"
      WHEN DAYOFWEEK(CONVERT_TZ(TIMESTAMP(${TABLE}.created_at),'America/New_York','UTC')) = 4 THEN "Wednesday"
      WHEN DAYOFWEEK(CONVERT_TZ(TIMESTAMP(${TABLE}.created_at),'America/New_York','UTC')) = 5 THEN "Thursday"
      WHEN DAYOFWEEK(CONVERT_TZ(TIMESTAMP(${TABLE}.created_at),'America/New_York','UTC')) = 6 THEN "Friday"
      WHEN DAYOFWEEK(CONVERT_TZ(TIMESTAMP(${TABLE}.created_at),'America/New_York','UTC')) = 7 THEN "Saturday"
    END

    ;;
  }

  dimension: weekday_rank {
    type: string
    sql: DAYOFWEEK(CONVERT_TZ(TIMESTAMP(${TABLE}.created_at),'America/New_York','UTC'))
    ;;
  }

  dimension: hin {
    type: string
    sql: ${TABLE}.hin ;;
  }

  dimension: patient_id {
    type: number
    sql: ${TABLE}.patient_id ;;
  }

  dimension: ramq_establishment_id {
    type: number
    sql: ${TABLE}.ramq_establishment_id ;;
  }

  dimension: professional_number {
    type: string
    sql: ${TABLE}.professional_number ;;
  }

  dimension_group: start_date {
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
    sql: ${TABLE}.start_date ;;
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
