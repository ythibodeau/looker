view: groups_plans {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT g.id, GROUP_CONCAT(pp.name_en) as plans FROM groups g
      INNER JOIN groups_pricing_plans gpp ON  gpp.group_id = g.id AND
                  ((gpp.start_date IS NULL AND gpp.end_date IS NULL) OR
                  (gpp.start_date IS NULL AND  gpp.end_date >= now()) OR
                  (gpp.start_date <= now() AND gpp.end_date IS NULL) OR
                  (gpp.start_date <= now() AND  gpp.end_date >= now()))
      INNER JOIN pricing_plans pp ON pp.id = gpp.plan_id
      GROUP BY 1;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: plans {
    type: string
    sql: ${TABLE}.plans ;;
  }

  set: detail {
    fields: [id, plans]
  }
}
