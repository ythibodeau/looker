view: pati__teluses {
  sql_table_name: petalmd.pati__teluses ;;

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

  dimension: emr_instance_id {
    type: string
    sql: ${TABLE}.emr_instance_id ;;
  }

  dimension: emr_type {
    type: string
    sql: ${TABLE}.emr_type ;;
  }

  dimension: pss_ohip_format {
    type: yesno
    sql: ${TABLE}.pss_ohip_format ;;
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