view: sche__change_request_flags {
  sql_table_name: petalmd.sche__change_request_flags ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: change_request_id {
    type: number
    sql: ${TABLE}.change_request_id ;;
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

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension: created_by_type {
    type: string
    sql: ${TABLE}.created_by_type ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: deleted_by_id {
    type: number
    sql: ${TABLE}.deleted_by_id ;;
  }

  dimension: deleted_by_type {
    type: string
    sql: ${TABLE}.deleted_by_type ;;
  }

  dimension: flag {
    type: number
    sql: ${TABLE}.flag ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
