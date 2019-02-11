view: ip_ranges {
  sql_table_name: petalmd.ip_ranges ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: end_ip {
    type: string
    sql: ${TABLE}.end_ip ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: start_ip {
    type: string
    sql: ${TABLE}.start_ip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, groups.name, groups.parent_group_id]
  }
}