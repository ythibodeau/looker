view: account_highest_scheduling_paying_plan {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT account_id,
    CASE
      WHEN MAX(plan_value) = 3 THEN "ADVANCED"
      WHEN MAX(plan_value) = 2 THEN "STANDARD"
      WHEN MAX(plan_value) = 1 THEN "BASIC"
      WHEN MAX(plan_value) = 0 THEN "TRIAL"
    END
     as plan_value
      FROM (
      SELECT M.account_id,
          CASE
          when P.code LIKE 'advanced%' THEN 3
          when P.code LIKE 'standard%' THEN 2
          when P.code LIKE 'basic%' THEN 1
          else 0
          END as plan_value FROM memberships M
      INNER JOIN groups G ON G.id = M.group_id and G.id NOT IN (SELECT DISTINCT content_group_id FROM console_content_groups)
      INNER JOIN groups_pricing_plans GPP ON GPP.group_id = M.group_id
      INNER JOIN pricing_plans P ON P.id = GPP.plan_id AND GPP.end_date is null

      INNER JOIN pricing_suites PS ON P.suite_id = PS.id AND PS.code = 'md_schedule'
      WHERE M.is_scheduled = 1 AND
      M.group_id NOT IN (SELECT console_content_groups.content_group_id FROM console_content_groups)
      ) A
      GROUP BY account_id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: plan_value {
    type: string
    sql: ${TABLE}.plan_value ;;
  }

  set: detail {
    fields: [account_id, plan_value]
  }
}
