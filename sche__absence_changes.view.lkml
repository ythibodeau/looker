view: sche__absence_changes {
  sql_table_name: petalmd.sche__absence_changes ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: absence {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.absence_date ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: category_from_id {
    type: number
    sql: ${TABLE}.category_from_id ;;
  }

  dimension: category_to_id {
    type: number
    sql: ${TABLE}.category_to_id ;;
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

  dimension: request_id {
    type: number
    sql: ${TABLE}.request_id ;;
  }

  dimension: restriction_kind_from_id {
    type: number
    sql: ${TABLE}.restriction_kind_from_id ;;
  }

  dimension: restriction_kind_to_id {
    type: number
    sql: ${TABLE}.restriction_kind_to_id ;;
  }

  dimension: slot {
    type: string
    sql: ${TABLE}.slot ;;
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
    drill_fields: [id]
  }

  measure: unique_absence_count {
    type: count_distinct
    sql: ${request_id} ;;
    drill_fields: [id, groups.name]
  }
}
