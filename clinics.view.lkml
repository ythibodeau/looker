view: clinics {
  derived_table: {
    explore_source: groups {
      column: id {}
      column: code {}
      column: acronym {}
      column: name {}
      column: adapterable_type { field: pati__providers.adapterable_type }
      filters: {
        field: pricing_suites.code
        value: "booking"
      }
      filters: {
        field: groups.is_trial
        value: "No"
      }
      filters: {
        field: groups.trial_subscription_id
        value: "NULL"
      }
      filters: {
        field: groups_pricing_plans.end_date
        value: "NULL"
      }
      filters: {
        field: groups.inactive
        value: "No"
      }
      filters: {
        field: pati__providers.adapterable_type
        value: "-NULL"
      }
    }
  }
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: code {}
  dimension: acronym {}
  dimension: name {}
  dimension: adapterable_type {
    label: "EMR Adapterable Type"
  }
}
