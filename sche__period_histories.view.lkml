view: sche__period_histories {
  sql_table_name: petalmd_development.sche__period_histories ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: admin_user_id {
    type: number
    sql: ${TABLE}.admin_user_id ;;
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

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: raw_dump {
    type: string
    sql: ${TABLE}.raw_dump ;;
  }

  dimension: source_object_id {
    type: number
    sql: ${TABLE}.source_object_id ;;
  }

  dimension: source_type {
    type: number
    sql: ${TABLE}.source_type ;;
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

  dimension: is_manual {
    type: yesno
    sql: ${source_type} IN (0,6) ;;
  }

  dimension: is_automatic {
    type: yesno
    sql: ${source_type} = 2 ;;
  }

  dimension: is_assignment {
    type: yesno
    sql: ${source_type} IN (0,2,6) ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: is_manual_count {
    type: count
    filters: {
      field: is_manual
      value: "Yes"
    }
  }

  measure: is_assignment_count {
    type: count
    filters: {
      field: is_assignment
      value: "Yes"
    }
  }


}
