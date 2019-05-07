view: group_highest_scheduling_plans {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT G.id as group_id,
      PP.code as plan_value,
      CASE PP.code
          WHEN 'basic_sched' THEN 1
          WHEN 'standard_sched' THEN 2
          WHEN 'advanced_sched' THEN 3
        END AS highest_plan

        FROM groups G
      LEFT JOIN group_billing_profiles GBP ON GBP.group_id = G.id
      INNER JOIN groups_pricing_plans GPP ON GPP.group_id = G.id
      INNER JOIN pricing_plans PP ON PP.id = GPP.plan_id
      INNER JOIN pricing_suites PS ON PS.id = PP.suite_id
      WHERE (recurring_billing_type <> 3 OR GBP.id IS NULL)
      AND G.implementation = 0
      AND G.inactive = 0
      AND schedules_enabled = 1
      AND PS.code = 'md_schedule'
      AND PP.code NOT LIKE 'trial%'
      AND (GPP.start_date IS NULL OR GPP.start_date <= NOW()) AND (GPP.end_date IS NULL OR GPP.end_date >= NOW())
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: group_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: highest_plan {
    type: number
    sql: ${TABLE}.highest_plan ;;
  }

  dimension: plan_value {
    type: string
    sql: ${TABLE}.plan_value ;;
  }

  set: detail {
    fields: [group_id, highest_plan, groups.code, groups.acronym, groups.name, health_institutions.name, health_clusters.name]
  }
}
