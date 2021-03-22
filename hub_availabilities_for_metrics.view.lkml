# If necessary, uncomment the line below to include explore_source.
# include: "petal.model.lkml"
explore:  hub_availabilities_for_metrics {}
view: hub_availabilities_for_metrics {
  derived_table: {
    explore_source: pati__availabilities {
      column: id {}
      column: group_id { field: x_groups.id }
      column: name { field: x_groups.name }
      column: account_id { field: accounts.id }
      column: hub_mnemonic { field: account_kinds.hub_mnemonic }
      column: clean_category { field: pati__offerings.clean_category }
      column: hub_account_filter_clean { field: pati__offerings.hub_account_filter_clean }
      column: start_date {}
      column: start_time {}
      column: end_time {}
      column: hub_visibility_level {}
      column: all_service_types { field: pati__offerings.all_service_types }
      column: count {}
      filters: {
        field: pati__availabilities.clean_visibility
        value: "created,disabled,reserved"
      }
      filters: {
        field: pati__availabilities.is_hub_availability
        value: "Yes"
      }
      filters: {
        field: x_groups.go_live_date
        value: "NOT NULL"
      }
    }
  }
  dimension: id {
    type: number
  }
  dimension: group_id {
    type: number
  }
  dimension: name {
    label: "X Groups Nom"
  }
  dimension: account_id {
    type: number
  }
  dimension: hub_mnemonic {}
  dimension: clean_category {}
  dimension: hub_account_filter_clean {}
  dimension_group: start_date {
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
  }
  dimension: start_time {
    type: date_time
  }
  dimension: end_time {
    type: date_time
  }
  dimension: hub_visibility_level {}
  dimension: all_service_types {
    type: number
  }
  dimension: count {
    type: number
  }
  measure: avg_hub {
    type: average
    sql: ${count} ;;
  }
}
