view: scheduling_users {
  derived_table: {
    sql: select distinct a.id from accounts a
      inner join membership_changes mc on a.id = mc.account_id
      inner join groups g on mc.group_id = g.id
      inner join groups_pricing_plans gpp on g.id = gpp.group_id
      inner join pricing_plans pp on gpp.plan_id = pp.id
      inner join pricing_suites ps on pp.suite_id = ps.id
      where ps.code = "md_schedule"
      and a.state IN ("confirmed", "deactivated");
       ;;
  }

  measure: count {
    type: count
    sql: ${id} ;;
    drill_fields: [detail*]
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  set: detail {
    fields: [id]
  }
}
