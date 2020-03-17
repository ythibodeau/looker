view: publication_average_delay {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
        periods_last_year.`groups.id`  AS `periods_last_year.groups_id`,
        AVG(periods_last_year.delay_in_days ) AS `periods_last_year.average_delay`
      FROM looker_scratch.LR$NW6Z75UVEW8A7ZK764HZC_periods_last_year AS periods_last_year

      GROUP BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: periods_last_year_groups_id {
    type: number
    sql: ${TABLE}.`periods_last_year.groups_id` ;;
  }

  dimension: periods_last_year_average_delay {
    type: number
    sql: ${TABLE}.`periods_last_year.average_delay` ;;
  }

  set: detail {
    fields: [periods_last_year_groups_id, periods_last_year_average_delay]
  }
}
