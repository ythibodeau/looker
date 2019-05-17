view: scheduling_accounts {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql:
select distinct a.id as account_id,
       a.state as state,
       a.confirmed_at as confirmed_at
from accounts a
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
    drill_fields: [detail*]
  }

  dimension: account_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension_group: confirmed_at {
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
  }

  set: detail {
    fields: [account_id]
  }
}
