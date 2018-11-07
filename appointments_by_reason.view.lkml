# If necessary, uncomment the line below to include explore_source.
# include: "test_yves.model.lkml"

view: appointments_by_reason {
  derived_table: {
    explore_source: pati__appointments {
      column: description_en { field: pati__reasons.description_en }
      column: count {}
      filters: {
        field: pati__appointments.cancelled
        value: "No"
      }
      filters: {
        field: pati__appointments.created_date
        value: "30 days"
      }
      filters: {
        field: pati__appointments.created_by_type
        value: "Patient::Patient"
      }
      filters: {
        field: groups.name
        value: "Clinique médicale St-Louis"
      }
    }
  }
  dimension: description_en {}
  dimension: count {
    type: number
  }
}
