view: accounts_group_list {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select a.id as id,
       a.first_name as first_name,
       a.last_name as last_name,
       a.kind_id as kind_id,
       GROUP_CONCAT(g.acronym) as group_list from accounts a
inner join memberships m on m.account_id = a.id
inner join groups g on g.id = m.group_id
group by a.id
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

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: group_list {
    type: string
    sql: ${TABLE}.group_list ;;
  }

  set: detail {
    fields: [id, first_name, last_name, kind_id, group_list]
  }
}
