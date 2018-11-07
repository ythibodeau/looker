view: julien {
  sql_table_name: petalmd_development.julien ;;

  dimension: account {
    type: number
    sql: ${TABLE}.account ;;
  }

  dimension: hin {
    type: string
    sql: ${TABLE}.hin ;;
  }

  dimension: sub {
    type: number
    sql: ${TABLE}.sub ;;
  }

  dimension: uid {
    type: string
    sql: ${TABLE}.uid ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
