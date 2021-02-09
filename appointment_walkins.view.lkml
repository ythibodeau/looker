view: appointment_walkins {
  derived_table: {
    explore_source: pati__appointments {
      column: availability_id {}
      column: id {}
      column: created_by_type {}
      filters: {
        field: pati__offerings.code
        value: "WALK-IN,WALK^_IN"
      }
    }
  }
  dimension: availability_id {
    type: number
  }
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: created_by_type {}

  measure: count {
    type: count
    drill_fields: [id]
  }
}
