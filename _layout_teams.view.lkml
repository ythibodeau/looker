view: _layout_teams {
  sql_table_name: petalmd_development.sche__layout_teams ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: background_first {
    type: string
    sql: ${TABLE}.background_first ;;
  }

  dimension: background_row {
    type: string
    sql: ${TABLE}.background_row ;;
  }

  dimension: bold_first {
    type: yesno
    sql: ${TABLE}.bold_first ;;
  }

  dimension: bold_row {
    type: yesno
    sql: ${TABLE}.bold_row ;;
  }

  dimension: color_first {
    type: string
    sql: ${TABLE}.color_first ;;
  }

  dimension: color_row {
    type: string
    sql: ${TABLE}.color_row ;;
  }

  dimension: layout_id {
    type: number
    sql: ${TABLE}.layout_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: team_id {
    type: number
    sql: ${TABLE}.team_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
