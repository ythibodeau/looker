view: pati__kinlogixes {
  sql_table_name: petalmd_development.pati__kinlogixes ;;

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

  dimension: domain_id {
    type: number
    sql: ${TABLE}.domain_id ;;
  }

  dimension: gmf_attribute {
    type: yesno
    sql: ${TABLE}.gmf_attribute ;;
  }

  dimension: override_url {
    type: string
    sql: ${TABLE}.override_url ;;
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
}
