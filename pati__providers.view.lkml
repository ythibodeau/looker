view: pati__providers {
  sql_table_name: petalmd.pati__providers ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: adapterable_id {
    type: number
    sql: ${TABLE}.adapterable_id ;;
  }

  dimension: adapterable_type {
    type: string
    sql: SUBSTRING_INDEX(${TABLE}.adapterable_type,"::", -1) ;;
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

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
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
    drill_fields: [id, groups.name, groups.parent_group_id]
  }
}