view: account_without_group {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT a.id FROM accounts a
      left join memberships m on m.account_id = a.id
      where m.account_id is NULL
       ;;
  }

  measure: count {
    type: count
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
