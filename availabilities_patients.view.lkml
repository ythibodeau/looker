# If necessary, uncomment the line below to include explore_source.
# include: "test_yves.model.lkml"

view: availabilities_patients {
  derived_table: {
    explore_source: pati__availabilities {
      column: account_task_id {}
      column: assignment_id {}
      column: created_by_emr {}
      column: created_date {}
      column: end_date {}
      column: error_code {}
      column: id {}
      column: start_date {}
      column: state {}
      column: visibility {}
      filters: {
        field: pati__availabilities.visibility
        value: "0"
      }
      filters: {
        field: pati__availabilities.state
        value: "0"
      }
    }
  }
  dimension: account_task_id {
    type: number
  }
  dimension: assignment_id {
    type: number
  }
  dimension: created_by_emr {
    label: "Pati Availabilities Created By Emr (Yes / No)"
    type: yesno
  }
  dimension: created_date {
    type: date
  }
  dimension: end_date {
    type: date
  }
  dimension: error_code {
    type: number
  }
  dimension: id {
    type: number
  }
  dimension: start_date {
    type: date
  }
  dimension: state {
    type: number
  }
  dimension: visibility {
    type: number
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
