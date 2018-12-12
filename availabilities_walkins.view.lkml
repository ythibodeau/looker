view: availabilities_walkins {
    derived_table: {
      explore_source: pati__availabilities {
        column: id {}
        column: start_date {}
        column: visibility {}
        filters: {
          field: pati__offerings.code
          value: "WALK^_IN,WALK^_IN"
        }
      }
    }
    dimension: id {
      primary_key: yes
      type: number
      sql: ${TABLE}.id ;;
    }
    dimension: start_date {
      type: date
    }
    dimension: visibility {
      type: number
    }

  measure: count {
    type: count
    drill_fields: [id]
  }
 }
