view: simple__assignment_split_infos {
  sql_table_name: petalmd_development.simple__assignment_split_infos ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: assignment_id {
    type: number
    sql: ${TABLE}.assignment_id ;;
  }

  dimension: split_index {
    type: number
    sql: ${TABLE}.split_index ;;
  }

  dimension: split_start_moment {
    type: number
    sql: ${TABLE}.split_start_moment ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
