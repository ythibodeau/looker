view: scheduling_publication_alert {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
        publication_average_delay.`periods_last_year.groups_id` AS group_id,
        min_next_released_period.period_id AS period_id,
        publication_average_delay.`periods_last_year.average_delay`  AS  average_publication_delay,
        DATE(CONVERT_TZ(min_next_released_period.period_start_date ,'UTC','America/New_York')) AS next_period_start_date,
        DATEDIFF(now(), min_next_released_period.period_start_date) AS days_from_now,
        (0.67 * publication_average_delay.`periods_last_year.average_delay`) as alert_trigger,
        DATE_ADD(DATE(CONVERT_TZ(min_next_released_period.period_start_date ,'UTC','America/New_York')), INTERVAL -(0.67 * publication_average_delay.`periods_last_year.average_delay`) DAY) as trigger_date,
        CASE
          WHEN (DATEDIFF(now(), min_next_released_period.period_start_date) > (0.67 * publication_average_delay.`periods_last_year.average_delay`) OR DATEDIFF(now(), min_next_released_period.period_start_date) >= 0) THEN true
          ELSE false
        END AS must_be_contacted
      FROM
                 looker_scratch.LR$NWYX7MEGQ7948XTQECGGG_publication_average_delay AS publication_average_delay
      LEFT JOIN looker_scratch.LR$NWRY3W1PURAB1NVRQ9UBE_min_next_released_period   AS min_next_released_period   ON (publication_average_delay.`periods_last_year.groups_id`) = min_next_released_period.group_id       ;;
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
    type: number
    sql: ${TABLE}.average_publication_delay ;;
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
