view: health_groups_by_product {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT  distinct g.id as group_id,
      g.name as group_name,
      pp.name_en as plan_name,
      ps.code as pricing_suite,
      gpp.start_date as plan_start_date,
      gpp.end_date as plan_end_date
      from groups g
      inner join groups_pricing_plans gpp on g.id = gpp.group_id
      inner join pricing_plans pp on pp.id = gpp.plan_id
      inner join pricing_suites ps on ps.id = pp.suite_id
      where ps.code IN ('md_schedule', 'hospital') and g.is_trial = 0 AND gpp.end_date is  null

UNION
(select
      distinct g.id as group_id,
      g.name as group_name,
      pp.name_en as plan_name,
      ps.code as pricing_suite,
      gpp.start_date as plan_start_date,
      gpp.end_date as plan_end_date
      from groups g
      inner join groups_pricing_plans gpp on g.id = gpp.group_id
      inner join pricing_plans pp on pp.id = gpp.plan_id
      inner join pricing_suites ps on ps.id = pp.suite_id
      where ps.code IN ('md_schedule', 'hospital') and g.is_trial = 0
      AND NOT EXISTS
      (select g2.id from groups g2
      inner join groups_pricing_plans gpp2 on g2.id = gpp2.group_id
      inner join pricing_plans pp2 on pp2.id = gpp2.plan_id
      inner join pricing_suites ps2 on ps2.id = pp2.suite_id
      where g2.id = g.id and ps2.code IN ('md_schedule', 'hospital') and gpp2.end_date IS NULL and g2.is_trial = 0))
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: group_name {
    type: string
    sql: ${TABLE}.group_name ;;
  }

  dimension: plan_name {
    type: string
    sql: ${TABLE}.plan_name ;;
  }

  dimension: pricing_suite {
    type: string
    sql: ${TABLE}.pricing_suite ;;
  }

  dimension_group: plan_start_date {
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
    sql: ${TABLE}.plan_start_date ;;
  }

  dimension_group: plan_end_date {
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
    sql: ${TABLE}.plan_end_date ;;
  }

  set: detail {
    fields: [
      group_id,
      group_name,
      plan_name,
      pricing_suite,
      plan_start_date,
      plan_end_date
    ]
  }
}
