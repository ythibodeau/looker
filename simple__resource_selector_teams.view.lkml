view: simple__resource_selector_teams {
  sql_table_name: petalmd.simple__resource_selector_teams ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: index {
    type: number
    sql: ${TABLE}.`index` ;;
  }

  dimension: kind {
    type: number
    sql: ${TABLE}.kind ;;
  }

  dimension: resource_selector_id {
    type: number
    sql: ${TABLE}.resource_selector_id ;;
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