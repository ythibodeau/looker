view: account_with_one_group {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select a.id, m.group_id from accounts a
      inner join membership_changes m on m.account_id = a.id
      group by a.id
      having count(distinct m.group_id) = 1
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

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  set: detail {
    fields: [id, group_id]
  }
}
