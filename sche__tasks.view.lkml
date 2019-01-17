view: sche__tasks {
  sql_table_name: petalmd_development.sche__tasks ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: block_id {
    type: number
    sql: ${TABLE}.block_id ;;
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

  dimension: end_moment {
    type: number
    sql: ${TABLE}.end_moment ;;
  }

  dimension: generation_guid {
    type: string
    sql: ${TABLE}.generation_guid ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
  }

  dimension: note {
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: start_moment {
    type: number
    sql: ${TABLE}.start_moment ;;
  }

  dimension: units {
    type: number
    sql: ${TABLE}.units ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    sql: COUNT(${id}) ;;
    drill_fields: [id]
  }
}
