view: scheduling_publication_alert {
  derived_table: {
    datagroup_trigger: scheduling_publication_alerting
    sql: SELECT
        publication_average_delay.`periods_last_year.groups_id` AS group_id,
        min_next_released_period.period_id AS period_id,
        ROUND(publication_average_delay.`periods_last_year.average_delay`)  AS  average_publication_delay,
        DATE(CONVERT_TZ(min_next_released_period.period_start_date ,'UTC','America/New_York')) AS next_period_start_date,
        DATEDIFF(now(), min_next_released_period.period_start_date) AS days_from_now,
        ROUND((0.67 * publication_average_delay.`periods_last_year.average_delay`)) as alert_trigger,
        DATE_SUB(DATE(CONVERT_TZ(min_next_released_period.period_start_date ,'UTC','America/New_York')), INTERVAL ABS((0.67 * publication_average_delay.`periods_last_year.average_delay`)) DAY) as trigger_date,
        CASE
          WHEN (DATEDIFF(now(), min_next_released_period.period_start_date) <= (0.67 * publication_average_delay.`periods_last_year.average_delay`) OR DATEDIFF(now(), min_next_released_period.period_start_date) >= 0) THEN true
          ELSE false
        END AS must_be_contacted
      FROM
                 ${publication_average_delay.SQL_TABLE_NAME} AS publication_average_delay
      LEFT JOIN ${min_next_released_period.SQL_TABLE_NAME}   AS min_next_released_period   ON (publication_average_delay.`periods_last_year.groups_id`) = min_next_released_period.group_id       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }


  dimension: average_publication_delay {
    label: "average_publication_delay"
    type: number
    sql: ABS(${TABLE}.average_publication_delay) ;;
  }

  dimension: next_period_start_date {
    type: date
    sql: ${TABLE}.next_period_start_date ;;
  }

  dimension: trigger_date {
    type: date
    sql: ${TABLE}.trigger_date ;;
  }

  dimension: days_from_now {
    type: number
    sql: ${TABLE}.days_from_now ;;
  }

  dimension: alert_trigger {
    type: number
    sql: ${TABLE}.alert_trigger ;;
  }

  dimension: must_be_contacted {
    type: number
    sql: ${TABLE}.must_be_contacted ;;
  }

  dimension: days_before_period_starts {
    label: "days_before_period_starts"
    type: number
    sql:DATEDIFF(${TABLE}.next_period_start_date, now())  ;;
  }

  set: detail {
    fields: [
      group_id,
      average_publication_delay,
      next_period_start_date,
      days_from_now,
      alert_trigger,
      must_be_contacted
    ]
  }
}
