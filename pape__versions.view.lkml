view: pape__versions {
  sql_table_name: petalmd.pape__versions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_type {
    type: string
    sql: ${TABLE}.item_type ;;
  }

  dimension: object {
    type: string
    sql: ${TABLE}.object ;;
  }

  dimension: whodunnit {
    type: string
    sql: ${TABLE}.whodunnit ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}