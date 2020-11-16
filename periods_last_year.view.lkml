view: periods_last_year {
  derived_table: {
    datagroup_trigger: scheduling_publication_alerting
    sql: SELECT
        x_groups.id  AS `groups.id`,
        sche__periods.id  AS `sche__periods.id`,
        DATE(CONVERT_TZ(sche__periods.published_at ,'UTC','America/New_York')) AS `sche__periods.published_date`,
        DATE(sche__periods.start_date ) AS `sche__periods.start_date`,
        DATEDIFF(sche__periods.published_at, sche__periods.start_date) as delay_in_days
      FROM petalmd.sche__periods  AS sche__periods
      INNER JOIN petalmd.groups  AS x_groups ON sche__periods.group_id = x_groups.id
      LEFT JOIN petalmd.health_institutions  AS health_institutions ON x_groups.health_institution_id = health_institutions.id
      INNER JOIN petalmd.groups_pricing_plans  AS groups_pricing_plans ON groups_pricing_plans.group_id = x_groups.id
      INNER JOIN petalmd.pricing_plans  AS pricing_plans ON groups_pricing_plans.plan_id = pricing_plans.id
      INNER JOIN petalmd.pricing_suites  AS pricing_suites ON pricing_plans.suite_id =  pricing_suites.id

      WHERE ((((sche__periods.published_at ) >= ((CONVERT_TZ(DATE_ADD(DATE(CONVERT_TZ(NOW(),'UTC','America/New_York')),INTERVAL -89 day),'America/New_York','UTC'))) AND (sche__periods.published_at ) < ((CONVERT_TZ(DATE_ADD(DATE_ADD(DATE(CONVERT_TZ(NOW(),'UTC','America/New_York')),INTERVAL -89 day),INTERVAL 90 day),'America/New_York','UTC')))))) AND (pricing_plans.code = 'standard_sched') AND (((CASE
                 WHEN pricing_suites.code = 'md_schedule' THEN 'Scheduling'
                 WHEN pricing_suites.code = 'hospital' THEN 'Scheduling'
                 WHEN pricing_suites.code = 'booking' THEN 'Booking'
                 WHEN pricing_suites.code = 'petal_message' THEN 'Messaging'
               END) = 'Scheduling'))
      GROUP BY 1,2,3,4
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: groups_id {
    type: number
    sql: ${TABLE}.`groups.id` ;;
  }

  dimension: sche__periods_id {
    type: number
    sql: ${TABLE}.`sche__periods.id` ;;
  }

  dimension: sche__periods_published_date {
    type: date
    sql: ${TABLE}.`sche__periods.published_date` ;;
  }

  dimension: sche__periods_start_date {
    type: date
    sql: ${TABLE}.`sche__periods.start_date` ;;
  }

  dimension: delay_in_days {
    type: number
    sql: ${TABLE}.delay_in_days ;;
  }

  measure: average_delay {
    type: average
    sql: ${TABLE}.delay_in_days ;;
  }

  set: detail {
    fields: [groups_id, sche__periods_id, sche__periods_published_date, sche__periods_start_date, delay_in_days]
  }
}
