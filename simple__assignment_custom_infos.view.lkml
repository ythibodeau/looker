view: simple__assignment_custom_infos {
  sql_table_name: petalmd.simple__assignment_custom_infos ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: annotation {
    type: string
    sql: ${TABLE}.annotation ;;
  }

  dimension: assignment_id {
    type: number
    sql: ${TABLE}.assignment_id ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: end_moment {
    type: number
    sql: ${TABLE}.end_moment ;;
  }

  dimension: start_moment {
    type: number
    sql: ${TABLE}.start_moment ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}