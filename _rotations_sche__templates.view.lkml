view: _rotations_sche__templates {
  sql_table_name: petalmd_development.sche__rotations_sche__templates ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: rotation_id {
    type: number
    sql: ${TABLE}.rotation_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
