view: accounts_with_one_membership {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select m.account_id, m.group_id from memberships m group by m.account_id having count(m.id) = 1 ;
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

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  set: detail {
    fields: [account_id, group_id]
  }
}
