view: group_highest_plans {
  derived_table: {
    sql: SELECT`G`.`id` AS `id`,
      (case
              when (`P`.`code` like 'advanced%') then 3
              when (`P`.`code` like 'standard%') then 2
              when (`P`.`code` like 'basic%') then 1
              else 0 end) AS `plan_value`
      FROM (((`groups` `G` join `groups_pricing_plans` `GPP` on((`GPP`.`group_id` = `G`.`id`))) join `pricing_plans` `P` on((`P`.`id` = `GPP`.`plan_id`))) join `pricing_suites` `PS` on(((`P`.`suite_id` = `PS`.`id`) and (`PS`.`code` = 'md_schedule')))) where ((`G`.`implementation` = 0) and (`G`.`inactive` = 0) and isnull(`GPP`.`end_date`) and (not(`G`.`id` in (select distinct CCG.`content_group_id` from `console_content_groups` CCG INNER JOIN groups G ON G.id = CCG.console_group_id AND G.implementation = 0 AND G.inactive = 0 AND G.code NOT LIKE 'CONSOLE-DEMO%'))));
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: plan_value {
    type: number
    sql: ${TABLE}.plan_value ;;
  }

  dimension: plan {
    type: string
    sql:
    CASE
      WHEN ${plan_value} = 1 THEN "BASIC"
      WHEN ${plan_value} = 2 THEN "STANDARD"
      WHEN ${plan_value} = 3 THEN "ADVANCED"
    END

    ;;
  }

  set: detail {
    fields: [id, plan_value]
  }
}
