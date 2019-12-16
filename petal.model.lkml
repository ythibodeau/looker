connection: "production_database"

# include all the views
include: "*.view"
include: "*.dashboard"

datagroup: test_yves_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: test_yves_default_datagroup

# Map Layers
map_layer: canada_layer {
  file: "canada_provinces.json"
  property_key: "name"
}

map_layer: canadacensus_layer {
  file: "canadacensus.json"
  property_key: "id"
}

map_layer: economic_regions_layer {
  file: "canada_regions.json"
  property_key: "ERNAME"
}


#####################################################################
# Global
#####################################################################

explore: account_group_counts {}

explore: health_groups_by_product {}

explore: health_messages_monthly_activity {
  join: accounts {
    sql_on: ${health_messages_monthly_activity.account_id} = ${accounts.id};;
    relationship: many_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: one_to_many
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: inner
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: one_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.id} ;;
    relationship: one_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }

  join: account_first_message {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_message.account_id} ;;
    relationship: one_to_one
  }

  join: messages {
    type: left_outer
    sql_on: ${accounts.id} = ${messages.account_id} ;;
    relationship: one_to_many
  }
}

explore: health_messages_previous_monthly_activity {}
explore: health_messages_retention_lifecycle {
  join: accounts {
    type: inner
    sql_on: ${health_messages_retention_lifecycle.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: one_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: inner
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: one_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.id} ;;
    relationship: one_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }
}

explore: action_monitorings {}

explore: users_products {}

explore: users_by_product {
  join: accounts {
    type: inner
    sql_on: ${users_by_product.id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: comments {
    type: inner
    sql_on: ${users_by_product.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }
}

explore: date_series_datetime {}

explore: territories {}

explore: economic_regions {

  join: territories {
    type: inner
    sql_on: ${economic_regions.territory_id} = ${territories.id} ;;
    relationship: many_to_one

  }

  join: health_institutions {
    type: left_outer
    sql_on: ${economic_regions.id} = ${health_institutions.region_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${health_institutions.id} = ${groups.health_institution_id};;
    relationship: one_to_many
  }

  join: memberships {
    type: left_outer
    sql_on: ${groups.id} = ${memberships.group_id} ;;
    relationship: one_to_many
  }

  join: accounts {
    type: left_outer
    sql_on: ${memberships.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql_on: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

}

explore: group_highest_scheduling_plans {

}

explore: account_with_one_group {
  join: accounts {
    type: inner
    sql_on: ${account_with_one_group.id} = ${accounts.id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: inner
    sql_on: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }
}

explore: group_billing_profiles {
  join: group_billing_subscriptions {
    type: left_outer
    sql_on: ${group_billing_profiles.id} = ${group_billing_subscriptions.group_billing_profile_id} ;;
    relationship: one_to_many
  }

  join: account_billing_subscriptions {
    type: left_outer
    sql_on: ${group_billing_subscriptions.id} = ${account_billing_subscriptions.group_billing_subscription_id} ;;
    relationship: one_to_many
  }

  join: accounts {
    type: left_outer
    sql_on: ${account_billing_subscriptions.account_id} = ${accounts.id} ;;
  }
}

explore: health_institutions {}

explore: health_clusters {

  join: territories {
    type: inner
    sql_on: ${health_clusters.territory_id} = ${territories.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${health_clusters.id} = ${health_institutions.health_cluster_id} ;;
    relationship: one_to_many
  }

  join: economic_regions {
    type: left_outer
    sql_on: ${health_institutions.region_id} = ${economic_regions.id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${health_institutions.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: location_geometries {
    type: left_outer
    sql_on: ${locations.id} = ${location_geometries.location_id} ;;
    relationship: one_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${health_institutions.id} = ${groups.health_institution_id} ;;
    relationship: one_to_many
  }

  join: specialties {
    type: left_outer
    sql_on: ${groups.specialty_id} = ${specialties.id} ;;
    relationship: many_to_one
  }

  join: group_kinds {
    type: inner
    sql_on: ${groups.kind_id} = ${group_kinds.id} ;;
    relationship: one_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${groups.id} = ${memberships.group_id} ;;
    relationship: one_to_many
  }

  join: accounts {
    type: left_outer
    sql_on: ${memberships.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql_on: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: sche__change_requests {
    view_label: "Change Requests"
    type: left_outer
    sql_on: ${groups.id} = ${sche__change_requests.group_id} ;;
    relationship: one_to_many
  }

  join: top_12_clusters_messaging {
    type: left_outer
    sql_on: ${health_clusters.id} = ${top_12_clusters_messaging.health_clusters_id} ;;
    relationship: one_to_one
  }

}

explore: specialties {
  join: accounts {
    type: left_outer
    sql_on: ${specialties.id} = ${accounts.specialty_id} ;;
    relationship: one_to_many
  }
}
explore: locations {}

explore: year_month_accounts {}
explore: year_month_patients {}

explore: year_month_table_patients {}

explore: year_month_table {

    join: monthly_activity_comments {
      type: left_outer
      sql_on: ${year_month_table.year_month} = ${monthly_activity_comments.comment_month_month} ;;
    }
}

explore: implementation_monitoring  {
  group_label: "Global"
}

explore: group_last_periods {
  group_label: "Global"

  join: groups {
    type: inner
    sql_on: ${groups.id} = ${group_last_periods.group_id} ;;
    relationship: one_to_one
  }

  join: memberships {
    type: inner
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: specialties {
    type: inner
    sql_on: ${specialties.id} = ${groups.specialty_id} ;;
    relationship: one_to_one
  }

  join: groups_pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.plan_id} = ${pricing_plans.id} ;;
    relationship: many_to_one
  }

  join: pricing_suites {
    type: inner
    sql_on: ${pricing_plans.suite_id} =  ${pricing_suites.id};;
    relationship: many_to_one
  }

  join: sche__tasks {
    type: inner
    sql_on:  ${sche__tasks.period_id} = ${group_last_periods.period_id};;
    relationship: many_to_one
  }

  join: holidays {
    type: left_outer
    sql_on: ${holidays.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }
}

explore: account_locations {
  group_label: "Global"
  join: accounts {
    type: left_outer
    sql_on: ${account_locations.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: accounts {
  group_label: "Global"
  #cancel_grouping_fields: [accounts.highest_paying_plan]
  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: accounts_group_list {
    type: left_outer
    sql_on: ${accounts.id} = ${accounts_group_list.id} ;;
    relationship: one_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: account_tenth_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_tenth_comment.account_id} ;;
    relationship: one_to_one
  }

  join: account_group_counts {
    type: left_outer
    sql_on: ${accounts.id} = ${account_group_counts.account_id} ;;
    relationship: one_to_one
  }

  join: account_kinds {
    type: left_outer
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: many_to_one
  }

  join: specialties {
    type: left_outer
    sql_on: ${accounts.specialty_id} = ${specialties.id} ;;
    relationship: many_to_one
  }

  join: comments {
    type: left_outer
    sql_on:  ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: messages {
    type: left_outer
    sql_on: ${accounts.id} = ${messages.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: inner
    sql_on: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: account_locations {
    type: left_outer
    sql_on: ${accounts.id} = ${account_locations.account_id} ;;
    relationship: one_to_many
  }

  join: account_highest_scheduling_plans {
    type: left_outer
    sql_on: ${accounts.id} = ${account_highest_scheduling_plans.account_id} ;;
    relationship: one_to_one
  }

  join: scheduling_actions {
    type: left_outer
    sql_on: ${accounts.id} = ${scheduling_actions.account_id} ;;
    relationship: one_to_many
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id};;
    relationship: one_to_many
  }

  join: groups {
    type: inner
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: one_to_one
  }

  join: groups_pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.plan_id} = ${pricing_plans.id} ;;
    relationship: many_to_one
  }

  join: pricing_suites {
    type: inner
    sql_on: ${pricing_plans.suite_id} =  ${pricing_suites.id};;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }

  join: console_access_groups {
    type: left_outer
    sql_on: ${groups.id} = ${console_access_groups.access_group_id} ;;
    relationship: one_to_many
  }

  join: console_groups {
    from: groups
    sql_on: ${console_access_groups.console_group_id} = ${console_groups.id} ;;
  }

  join: centres {
    type: inner
    sql_on: ${groups.centre_id} = ${centres.id} ;;
    relationship: many_to_one
  }

  join: pati__account_tasks {
    type: left_outer
    sql_on: ${accounts.id} = ${pati__account_tasks.account_id} ;;
    relationship: one_to_many
  }

  join: pati__availabilities {
    type: left_outer
    sql_on: ${pati__account_tasks.id} = ${pati__availabilities.account_task_id} ;;
    relationship: one_to_many
  }

  join: users_by_product {
    type: left_outer
    sql_on: ${accounts.id} = ${users_by_product.id} ;;
    relationship: one_to_many
  }

  join: account_without_group {
    type: left_outer
    sql_on: ${accounts.id} = ${account_without_group.id} ;;
    relationship: one_to_one
  }
}

explore: accounts_subspecialties {
  group_label: "Global"
  join: accounts {
    type: left_outer
    sql_on: ${accounts_subspecialties.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: account_group_paying_links {
  group_label: "Global"
  fields: [ALL_FIELDS*, -groups.last_period_id]
  join: accounts {
    type: left_outer
    sql_on: ${account_group_paying_links.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${account_group_paying_links.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: authentication_tokens {
  group_label: "Global"
  join: accounts {
    type: left_outer
    sql_on: ${authentication_tokens.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: contact_method_histories {
  group_label: "Global"
  join: accounts {
    type: left_outer
    sql_on: ${contact_method_histories.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: deliveries {
  group_label: "Global"
  join: delivery_services {
    type: left_outer
    sql_on: ${deliveries.delivery_service_id} = ${delivery_services.id} ;;
    relationship: many_to_one
  }

  join: notifications {
    type: left_outer
    sql_on: ${deliveries.notification_id} = ${notifications.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${notifications.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql_on: ${notifications.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: notification_kinds {
    type: left_outer
    sql_on: ${notifications.notification_kind_id} = ${notification_kinds.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${discussions.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: distribution_lists {
    type: left_outer
    sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: delivery_services {}

explore: group_absence_slot_kinds {
  group_label: "Global"
  join: groups {
    type: left_outer
    sql_on: ${group_absence_slot_kinds.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: absence_slot_kinds {
    type: left_outer
    sql_on: ${group_absence_slot_kinds.absence_slot_kind_id} = ${absence_slot_kinds.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: group_analytics_reports {
  group_label: "Global"
  join: groups {
    type: left_outer
    sql_on: ${group_analytics_reports.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: group_distribution_lists {
  group_label: "Global"
  join: groups {
    type: left_outer
    sql_on: ${group_distribution_lists.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: group_export_datas {
  group_label: "Global"
  join: groups {
    type: left_outer
    sql_on: ${group_export_datas.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: groups_churn_booking {}
explore: groups_churn_scheduling {}
explore: groups_churn_messaging {}

explore: groups {
  group_label: "Global"
  cancel_grouping_fields: [accounts.highest_paying_plan, groups.is_scheduling, groups.pricing_plan_test]

  join: group_kinds {
    type: inner
    sql_on: ${groups.kind_id} = ${group_kinds.id} ;;
    relationship: many_to_one
  }

  join: groups_not_in_console {
    type: left_outer
    sql_on: ${groups.id} = ${groups_not_in_console.content_group_id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.id} ;;
    relationship: many_to_one
  }

  join: sche__periods {
    type: left_outer
    sql_on: ${groups.id} = ${sche__periods.group_id} ;;
    relationship: one_to_many
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: location_geometries {
    type: left_outer
    sql_on: ${locations.id} = ${location_geometries.location_id} ;;
    relationship: one_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: specialties {
    type: left_outer
    sql_on: ${groups.specialty_id} = ${specialties.id} ;;
    relationship: one_to_one
  }

  join: groups_pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.group_id} = ${groups.id} AND
            ((${groups_pricing_plans.start_date} IS NULL AND ${groups_pricing_plans.end_date} IS NULL) OR
            (${groups_pricing_plans.start_date} IS NULL AND ${groups_pricing_plans.end_date} >= now()) OR
            (${groups_pricing_plans.start_date} <= now() AND ${groups_pricing_plans.end_date} IS NULL) OR
            (${groups_pricing_plans.start_date} <= now() AND ${groups_pricing_plans.end_date} >= now()))
            ;;
    relationship: one_to_many
  }

  join: pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.plan_id} = ${pricing_plans.id} ;;
    relationship: many_to_one
  }

  join: pricing_suites {
    type: inner
    sql_on: ${pricing_plans.suite_id} =  ${pricing_suites.id};;
    relationship: many_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: membership_kinds {
    type: inner
    sql_on: ${memberships.kind_id} = ${membership_kinds.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${memberships.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: one_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: sche__change_requests {
    view_label: "Change Requests"
    type: left_outer
    sql_on: ${sche__change_requests.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: pati__providers {
    view_label: "EMR"
    type: left_outer
    sql_on: ${pati__providers.group_id} = ${groups.id};;
    relationship: many_to_one
  }

  join: pati__reasons {
    view_label: "Appointment Reason"
    type: inner
    sql_on: ${pati__reasons.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: pati__offerings {
    view_label: "Offering"
    type: inner
    sql_on: ${pati__reasons.offering_id} = ${pati__offerings.id} ;;
    relationship: many_to_one
  }

  join: pati__tasks {
    view_label: "Tasks"
    type: inner
    sql_on: ${pati__tasks.reason_id} = ${pati__reasons.id} ;;
    relationship: many_to_one
  }

  join: pati__account_tasks {
    view_label: "Account Tasks"
    type: inner
    sql_on: ${pati__account_tasks.task_id} = ${pati__tasks.id} ;;
    relationship: many_to_one
  }

  join: pati__availabilities {
    view_label: "Availabilities"
    type: inner
    sql_on: ${pati__availabilities.account_task_id} = ${pati__account_tasks.id} ;;
    relationship: many_to_one
  }

  join: pati__appointments {
    view_label: "Appointments"
    type: inner
    sql_on: ${pati__appointments.availability_id} = ${pati__availabilities.id} ;;
    relationship: one_to_one
  }

  join: availabilities_walkins {
    view_label: "Walk-in Availabilities"
    type: inner
    sql_on: ${pati__appointments.availability_id} = ${availabilities_walkins.id} ;;
    relationship: one_to_one
  }

  join: appointment_walkins {
    view_label: "Walk-in Appointments"
    type: inner
    sql_on: ${pati__appointments.id} = ${appointment_walkins.id} ;;
    relationship: one_to_one
  }

  join: noti__notifications {
    view_label: "Reminders"
    type: left_outer
    sql_on: ${noti__notifications.context_id} = ${pati__appointments.id} ;;
    relationship: many_to_one
  }

  join: appointment_reminders {
    view_label: "Appointment Reminders"
    type: left_outer
    sql_on: ${pati__appointments.id} = ${appointment_reminders.context_id} ;;
    relationship: many_to_one
  }

  join: discussions {
    type: left_outer
    sql_on: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: holidays {
    type: left_outer
    sql_on: ${holidays.group_id} = ${groups.id} ;;
    relationship: one_to_many
  }

  join: group_last_periods {
    type: inner
    sql_on: ${group_last_periods.group_id} = ${groups.id} ;;
    relationship: one_to_one
  }

  join: sche__tasks {
    type: left_outer
    sql_on: ${group_last_periods.period_id} = ${sche__tasks.period_id} ;;
    relationship: one_to_many
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }

}

explore: groups_pricing_plans {
  group_label: "Global"
  join: groups {
    type: left_outer
    sql_on: ${groups_pricing_plans.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: holidays {
  group_label: "Global"
  join: groups {
    type: left_outer
    sql_on: ${holidays.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: ics_subscriptions {
  group_label: "Global"
  hidden: yes
  join: accounts {
    type: left_outer
    sql_on: ${ics_subscriptions.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

}

explore: ip_ranges {
  group_label: "Global"
  hidden: yes
  join: groups {
    type: left_outer
    sql_on: ${ip_ranges.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: licenses {
  join: accounts {
    type: left_outer
    sql_on: ${licenses.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: location_geometries {
  group_label: "Global"
  hidden: yes
  join: locations {
    type: left_outer
    sql_on: ${location_geometries.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: membership_changes {
  group_label: "Global"

  join: membership_change_kinds {
    type: inner
    sql_on: ${membership_changes.kind_id} = ${membership_change_kinds.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${membership_changes.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${membership_changes.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: memberships {
  group_label: "Global"
  join: accounts {
    type: left_outer
    sql_on: ${memberships.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: settings {
    type: left_outer
    sql_on: ${memberships.setting_id} = ${settings.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: folders {
  group_label: "Global"
    join: accounts {
      type: left_outer
      sql_on: ${folders.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: meeting_attendees {
    join: accounts {
      type: left_outer
      sql_on: ${meeting_attendees.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: meeting_events {
  group_label: "Global"
    join: accounts {
      type: left_outer
      sql_on: ${meeting_events.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: meeting_attendees {
      type: inner
      sql_on: ${meeting_events.id} = ${meeting_attendees.event_id} ;;
      relationship: one_to_many
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${meeting_events.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

    join: groups {
      type: left_outer
      sql_on: ${meeting_events.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }
  }

explore: notification_filter_items {
  group_label: "Global"
    join: notification_filters {
      type: left_outer
      sql_on: ${notification_filter_items.notification_filter_id} = ${notification_filters.id} ;;
      relationship: many_to_one
    }

    join: groups {
      type: left_outer
      sql_on: ${notification_filters.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${notification_filters.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: notification_filters {
  group_label: "Global"
    join: groups {
      type: left_outer
      sql_on: ${notification_filters.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${notification_filters.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: notification_preferences {
  group_label: "Global"
    join: accounts {
      type: left_outer
      sql_on: ${notification_preferences.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: notifications {
  group_label: "Global"
    join: accounts {
      type: left_outer
      sql_on: ${notifications.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql_on: ${notifications.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: notification_kinds {
      type: left_outer
      sql_on: ${notifications.notification_kind_id} = ${notification_kinds.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

    join: groups {
      type: left_outer
      sql_on: ${discussions.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: distribution_lists {
      type: left_outer
      sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }
  }

explore: pricing_plans {

  join: pricing_suites {
    type: inner
    sql_on: ${pricing_plans.suite_id} - ${pricing_suites.id} ;;
    relationship: many_to_one
  }

  join: group_highest_scheduling_plans {
    type: left_outer
    sql_on: ${pricing_plans.code} = ${group_highest_scheduling_plans.plan_value} ;;
    relationship: one_to_many
  }

  join: account_highest_scheduling_plans {
    type: left_outer
    sql_on: ${pricing_plans.code} = ${account_highest_scheduling_plans.plan_value} ;;
    relationship: one_to_many
  }

  join: accounts {
    type: left_outer
    sql_on: ${account_highest_scheduling_plans.account_id} = ${accounts.id} ;;
    relationship: one_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: many_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }
}

explore: pricing_plans_products {
  group_label: "Global"
    join: products {
      type: left_outer
      sql_on: ${pricing_plans_products.product_id} = ${products.id} ;;
      relationship: many_to_one
    }
  }

explore: pricing_suites {
  group_label: "Global"
}

explore: profile_preferences {
    group_label: "Global"
    join: profiles {
      type: left_outer
      sql_on: ${profile_preferences.profile_id} = ${profiles.id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${profiles.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: profiles {
  group_label: "Global"
    join: accounts {
      type: left_outer
      sql_on: ${profiles.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: noti__notifications {}

#explore: notification_kinds {}

#explore: mobile_devices {
#     join: accounts {
#       type: left_outer
#       sql_on: ${mobile_devices.account_id} = ${accounts.id} ;;
#       relationship: many_to_one
#     }
#
#     join: account_first_comment {
#       type: left_outer
#       sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
#       relationship: one_to_one
#     }
#
#     join: comments {
#       type: left_outer
#       sql_on: ${accounts.id} = ${comments.account_id} ;;
#       relationship: one_to_many
#     }
#
#     join: discussions {
#       type: left_outer
#       sql: ${comments.discussion_id} = ${discussions.id} ;;
#       relationship: many_to_one
#     }
#
#     join: timezones {
#       type: left_outer
#       sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
#       relationship: many_to_one
#     }
#   }

#explore: meeting_billing_codes {
#     join: groups {
#       type: left_outer
#       sql_on: ${meeting_billing_codes.group_id} = ${groups.parent_group_id} ;;
#       relationship: many_to_one
#     }
#
#     join: centres {
#       type: left_outer
#       sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
#       relationship: many_to_one
#     }
#
#     join: locations {
#       type: left_outer
#       sql_on: ${groups.location_id} = ${locations.id} ;;
#       relationship: many_to_one
#     }
#
#     join: timezones {
#       type: left_outer
#       sql_on: ${groups.timezone_id} = ${timezones.id} ;;
#       relationship: many_to_one
#     }
#   }

#explore: meeting_delegations {}

#explore: membership_change_kinds {}

#explore: membership_kinds {}

#explore: locations {}

#explore: holiday_options {}

#explore: group_kinds {}

#explore: group_export_data_kinds {}

#explore: contact_methods {}

#explore: countries {}

#explore: custom_tokens {}

explore: centres {}

#explore: attendee_answers {}

#explore: account_statuses {}

explore: account_kinds {
  join: accounts {
    type: left_outer
    sql_on: ${account_kinds.id} = ${accounts.kind_id} ;;
    relationship: one_to_many
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: specialties {
    type: left_outer
    sql_on: ${accounts.specialty_id} = ${specialties.id} ;;
    relationship: many_to_one
  }
}

#explore: account_kinds_specialties {}

# explore: product_audience_kinds {}
#
# explore: product_audiences {
#   join: products {
#     type: left_outer
#     sql_on: ${product_audiences.product_id} = ${products.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: products {}

#####################################################################
# Petal Message
#####################################################################

explore: mess__mobile_notif_preferences {}

explore: messages {
  group_label: "Petal Message"
  join: accounts {
    type: inner
    sql_on: ${messages.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_message {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_message.account_id} ;;
    relationship: one_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }

  join: territories {
    type: left_outer
    sql_on: ${health_institutions.territory_id} = ${territories.id} ;;
    relationship: one_to_many
  }
}

# --- Product Health --- #
explore: monthly_activity_previous_comments
 {
  group_label: "Petal Message"
 }

explore: account_tenth_comment  {
  group_label: "Petal Message"

  join: accounts {
    type: inner
    sql_on: ${account_tenth_comment.account_id} = ${accounts.id} ;;
    relationship: one_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: one_to_one
  }
}

explore: account_first_message {
  join: messages {
    type: inner
    sql_on: ${account_first_message.account_id} = ${messages.account_id} ;;
    relationship: one_to_many
  }
}

explore: account_first_comment {
  group_label: "Petal Message"

  join: accounts {
    type: inner
    sql_on: ${account_first_comment.account_id} = ${accounts.id} ;;
    relationship: one_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: one_to_one
  }

  join: memberships {
    type: inner
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: inner
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: inner
    sql_on: ${groups.centre_id} = ${centres.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }
}

explore: monthly_activity_comments {
  group_label: "Petal Message"

  join: accounts {
    sql_on: ${monthly_activity_comments.account_id} = ${accounts.id};;
    relationship: many_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: one_to_many
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: inner
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: one_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.id} ;;
    relationship: one_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }
}

explore: comments_retention_lifecycle {
  join: accounts {
    type: inner
    sql_on: ${comments_retention_lifecycle.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: one_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: inner
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: one_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.id} ;;
    relationship: one_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }
}

explore: active_users {
  join: accounts {
    type: left_outer
    sql_on: ${active_users.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: one_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: memberships {
    type: inner
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: inner
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: inner
    sql_on: ${groups.centre_id} = ${centres.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }
}

# --- Product Health --- #

explore: account_distribution_lists {
  group_label: "Petal Message"
  join: accounts {
    type: left_outer
    sql_on: ${account_distribution_lists.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: account_kind_distribution_lists {
  group_label: "Petal Message"
  join: account_kinds {
    type: left_outer
    sql_on: ${account_kind_distribution_lists.account_kind_id} = ${account_kinds.id} ;;
    relationship: many_to_one
  }
}

explore: comm__documents {
  fields: [ALL_FIELDS*, -groups.last_period_id]
  label: "Documents"
  group_label: "Petal Message"
  join: accounts {
    type: left_outer
    sql_on: ${comm__documents.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${comm__documents.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${comm__documents.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: attachments {
    type: inner
    sql_on: ${comm__documents.id} = ${attachments.attachable_id} AND ${attachments.attachable_type} = "Communication::Document" ;;
    relationship: one_to_one
  }
}

explore: comm__dossiers {
  group_label: "Petal Message"
  join: accounts {
    type: left_outer
    sql_on: ${comm__dossiers.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${comm__dossiers.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${comm__dossiers.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: comm__links {
  group_label: "Petal Message"
  join: accounts {
    type: left_outer
    sql_on: ${comm__links.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${comm__links.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${comm__links.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: comments {
  group_label: "Petal Message"
  join: discussions {
    type: left_outer
    sql_on: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: participants {
    type: left_outer
    sql_on: ${discussions.id} = ${participants.discussion_id} ;;
    relationship: one_to_many
  }

  join: readers {
    from: accounts
    type: left_outer
    sql_on: ${participants.account_id} = ${readers.id} ;;
    relationship: many_to_one
  }

  join: recipients {
    type: inner
    sql_on: ${recipients.discussion_id} = ${discussions.id} ;;
    relationship: one_to_one
  }

  join: accounts {
    type: inner
    sql_on: ${comments.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_locations {
    type: left_outer
    sql_on: ${accounts.id} = ${account_locations.account_id} ;;
    relationship: one_to_many
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: memberships {
    type: inner
    sql_on: ${memberships.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
    relationship: one_to_one
  }

  join: specialties {
    type: inner
    sql_on: ${accounts.specialty_id} = ${specialties.id} ;;
    relationship: one_to_one
  }

  join: groups {
    type: inner
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: group_kinds {
    type: inner
    sql_on: ${groups.kind_id} = ${group_kinds.id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: one_to_one
  }

  join: location_geometries {
    type: inner
    sql_on: ${locations.id} = ${location_geometries.location_id} ;;
    relationship: one_to_one
  }

  join: distribution_lists {
    type: left_outer
    sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.id} ;;
    relationship: many_to_one
  }

  join: attachments {
    type: left_outer
    sql_on: ${comments.id} = ${attachments.attachable_id} AND ${attachments.attachable_type} = "Comment" ;;
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: territories {
    type: left_outer
    sql_on: ${health_institutions.territory_id} = ${territories.id} ;;
    relationship: one_to_many
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }
}

explore: discussion_flags {
  group_label: "Petal Message"
  hidden: yes
    join: discussions {
      type: left_outer
      sql_on: ${discussion_flags.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${discussions.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: groups {
      type: left_outer
      sql_on: ${discussions.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: distribution_lists {
      type: left_outer
      sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }
  }

explore: discussions {
  group_label: "Petal Message"

    join: recipients {
      type: inner
      sql_on: ${recipients.discussion_id} = ${discussions.id} ;;
      relationship: one_to_one
    }

    join: participants {
      type: inner
      sql_on: ${discussions.id} = ${participants.discussion_id} ;;
      relationship: one_to_many
    }

    join: comments {
      type: left_outer
      sql_on: ${discussions.id} = ${comments.discussion_id} ;;
      relationship: one_to_many
    }

  join: accounts {
    type: left_outer
    sql_on: ${comments.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: memberships {
    type: inner
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

    join: account_kinds {
      type: inner
      sql_on: ${accounts.kind_id} = ${account_kinds.id} ;;
      relationship: one_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: groups {
      type: left_outer
      sql_on: ${memberships.group_id} = ${groups.id} ;;
      relationship: many_to_one
    }

    join: health_institutions {
      type: left_outer
      sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
      relationship: many_to_one
    }

    join: health_clusters {
      type: left_outer
      sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
      relationship: many_to_one
    }

    join: distribution_lists {
      type: left_outer
      sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: participant_flags {
      type: left_outer
      sql_on: ${participants.id} = ${participant_flags.participant_id} ;;
      relationship: one_to_many
    }

    join: discussion_flags {
      type: left_outer
      sql_on: ${discussions.id} = ${discussion_flags.discussion_id} ;;
      relationship: one_to_many
    }
  }

explore: mess__messages {

  join: mess__conversers {
    type: inner
    sql_on: ${mess__messages.converser_id} = ${mess__conversers.id} ;;
    relationship: many_to_many
  }

  join: accounts {
    type: inner
    sql_on: ${mess__conversers.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
  }

}

explore: mess__conversations {
    join: accounts {
      type: left_outer
      sql_on: ${mess__conversations.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
  }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: mess__converser_messages {

  join: mess__conversers {
    type: inner
    sql_on: ${mess__converser_messages.converser_id} = ${mess__conversers.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: inner
    sql_on: ${mess__conversers.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
  }
}

explore: mess__conversers {
    join: accounts {
      type: left_outer
      sql_on: ${mess__conversers.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: mess__history_conversers {}

explore: mess__message_mentions {
    join: accounts {
      type: left_outer
      sql_on: ${mess__message_mentions.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: participant_flags {
    group_label: "Petal Message"
    join: participants {
      type: left_outer
      sql_on: ${participant_flags.participant_id} = ${participants.id} ;;
      relationship: many_to_one
    }

    join: discussions {
      type: left_outer
      sql_on: ${participants.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${participants.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: groups {
      type: left_outer
      sql_on: ${discussions.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: distribution_lists {
      type: left_outer
      sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: participant_folders {
    group_label: "Petal Message"
    join: folders {
      type: left_outer
      sql_on: ${participant_folders.folder_id} = ${folders.id} ;;
      relationship: many_to_one
    }

    join: participants {
      type: left_outer
      sql_on: ${participant_folders.participant_id} = ${participants.id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${folders.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

    join: discussions {
      type: left_outer
      sql_on: ${participants.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: groups {
      type: left_outer
      sql_on: ${discussions.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: distribution_lists {
      type: left_outer
      sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }
  }

explore: participants {
  group_label: "Petal Message"
    join: discussions {
      type: left_outer
      sql_on: ${participants.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${participants.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
  }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: groups {
      type: left_outer
      sql_on: ${discussions.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: distribution_lists {
      type: left_outer
      sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: recipients {
    group_label: "Petal Message"
    join: discussions {
      type: left_outer
      sql_on: ${recipients.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${discussions.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: groups {
      type: left_outer
      sql_on: ${discussions.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: distribution_lists {
      type: left_outer
      sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }
  }

explore: shared_distribution_lists {
    group_label: "Petal Message"
    join: accounts {
      type: left_outer
      sql_on: ${shared_distribution_lists.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

#explore: distribution_lists {}

#explore: attachments {}

#####################################################################
# Petal Agenda
#####################################################################


# This version is not for chargeBee where we exclude console

explore: scheduling_actions {}
explore: scheduling_retention_lifecycle {}
explore: monthly_activity_scheduling {}
explore: monthly_activity_previous_scheduling {}

explore: active_users_scheduling {
  join: accounts {
    type: inner
    sql_on: ${active_users_scheduling.account_id} = ${accounts.id} ;;
    relationship: one_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
  }
}

explore: scheduling_accounts {
  join: accounts {
    type: inner
    sql_on: ${scheduling_accounts.account_id} = ${accounts.id} ;;
    relationship: one_to_one
  }

  join: scheduling_actions {
    type: left_outer
    sql_on: ${scheduling_accounts.account_id} = ${scheduling_actions.account_id} ;;
    relationship: one_to_many
  }

  join: active_users_scheduling {
    type: left_outer
    sql_on: ${scheduling_accounts.account_id} = ${active_users_scheduling.account_id} ;;
    relationship: one_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${accounts.id} = ${memberships.account_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: left_outer
    sql_on: ${memberships.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
  }

}

explore: sche__period_histories {
  group_label: "Petal Agenda"
  label: "Period Histories"

  join: sche__assignments {
    type: inner
    sql_on: ${sche__period_histories.id} = ${sche__assignments.period_history_id} ;;
    relationship: one_to_many
  }

}

explore: sche__change_requests {
  group_label: "Petal Agenda"
  label: "Change Requests"

  join: sche__change_request_flags {
    type: left_outer
    sql_on: ${sche__change_requests.id} = ${sche__change_request_flags.change_request_id} ;;
    relationship: one_to_many
  }

  join: groups {
    type: inner
    sql_on: ${groups.id} = ${sche__change_requests.group_id} ;;
    relationship: one_to_many
  }

  join: health_institutions {
    type: left_outer
    sql_on: ${groups.health_institution_id} = ${health_institutions.id} ;;
    relationship: many_to_one
  }

  join: health_clusters {
    type: left_outer
    sql_on: ${health_institutions.health_cluster_id} = ${health_clusters.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: inner
    sql_on: ${accounts.id} = ${sche__change_requests.initiated_by_id} ;;
    relationship: one_to_many
  }

  join: specialties {
    type: inner
    sql_on: ${accounts.specialty_id} = ${specialties.id} ;;
    relationship: one_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: sche__absence_changes {
    type: left_outer
    sql_on: ${sche__change_requests.id} = ${sche__absence_changes.request_id} AND ${sche__absence_changes.request_id} IS NULL ;;
    relationship: many_to_one
  }
}

explore: sche__absence_changes {
  group_label: "Petal Agenda"

  join: categories {
    type: inner
    sql_on: ${sche__absence_changes.category_to_id} = ${categories.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: inner
    sql_on: ${categories.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }
}

explore: sche__periods {
  label: "Periods"
  group_label: "Petal Agenda"

  join: groups {
    type: inner
    sql_on: ${sche__periods.group_id} = ${groups.id}  ;;
    relationship: many_to_one
  }

  join: admi__users {
    type: left_outer
    sql_on: ${groups.script_creator_id} = ${admi__users.id} ;;
    relationship: one_to_one
  }

  join: groups_pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.plan_id} = ${pricing_plans.id} ;;
    relationship: many_to_one
  }

  join: pricing_suites {
    type: inner
    sql_on: ${pricing_plans.suite_id} =  ${pricing_suites.id};;
    relationship: many_to_one
  }

  join: sche__change_requests {
    view_label: "Change Request"
    type: inner
    sql_on: ${sche__change_requests.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: inner
    sql_on: ${sche__change_requests.initiated_by_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: memberships {
    type: left_outer
    sql_on: ${groups.id} = ${memberships.group_id} ;;
    relationship: one_to_many
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: account_kinds {
    type: inner
    sql_on: ${accounts.kind_id} = ${account_kinds.id}  ;;
    relationship: many_to_one
  }

  join: sche__sourcings {
    type: inner
    sql_on: ${sche__periods.sourcing_id} = ${sche__sourcings.id};;
    relationship: one_to_one
  }

  join: sche__scripts {
    type: inner
    sql_on: ${sche__scripts.sourcing_id} = ${sche__sourcings.id} ;;
    relationship: many_to_one
  }

  join: sche__steps {
    type: inner
    sql_on: ${sche__steps.script_id} = ${sche__scripts.id} ;;
    relationship: many_to_one
  }

  join: sche__step_results {
    type: inner
    sql_on: ${sche__step_results.step_id} = ${sche__step_results.id} ;;
    relationship: one_to_one

  }

  join: sche__period_histories {
    type: inner
    sql_on: ${sche__period_histories.period_id} = ${sche__periods.id} ;;
    relationship: many_to_one
  }

  join: sche__assignments {
    type: inner
    sql_on: ${sche__period_histories.id} = ${sche__assignments.period_history_id} ;;
    relationship: one_to_many
  }

  join: sche__plans {
    type: inner
    sql_on: ${sche__plans.period_id} = ${sche__periods.id} ;;
    relationship: one_to_one
  }

#   join: sche__assignments {
#     type: inner
#     sql_on: ${sche__assignments.plan_id} = ${sche__plans.id} ;;
#     relationship: many_to_one
#   }

}

explore: absence_limits {
  group_label: "Petal Agenda"
  join: accounts {
    type: left_outer
    sql_on: ${absence_limits.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: absence_notification_filters {
  fields: [ALL_FIELDS*, -groups.last_period_id]
  group_label: "Petal Agenda"
  join: absence_notifications {
    type: left_outer
    sql_on: ${absence_notification_filters.absence_notification_id} = ${absence_notifications.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${absence_notifications.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: recipients {
    type: left_outer
    sql_on: ${absence_notifications.recipient_id} = ${recipients.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: discussions {
    type: left_outer
    sql_on: ${recipients.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${discussions.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: distribution_lists {
    type: left_outer
    sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
    relationship: many_to_one
  }
}

explore: absence_notifications {
  fields: [ALL_FIELDS*, -groups.last_period_id]
  group_label: "Petal Agenda"
  join: groups {
    type: left_outer
    sql_on: ${absence_notifications.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: recipients {
    type: left_outer
    sql_on: ${absence_notifications.recipient_id} = ${recipients.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: discussions {
    type: left_outer
    sql_on: ${recipients.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: accounts {
    type: left_outer
    sql_on: ${discussions.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: distribution_lists {
    type: left_outer
    sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
    relationship: many_to_one
  }
}

explore: absence_report_configs {
  fields: [ALL_FIELDS*, -groups.last_period_id]
  group_label: "Petal Agenda"
  join: groups {
    type: left_outer
    sql_on: ${absence_report_configs.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: restriction_kinds {
    type: left_outer
    sql_on: ${absence_report_configs.restriction_kind_id} = ${restriction_kinds.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: absences {
  fields: [ALL_FIELDS*, -groups.last_period_id]
  group_label: "Petal Agenda"
  join: accounts {
    type: left_outer
    sql_on: ${absences.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: left_outer
    sql_on: ${absences.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${absences.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }
}

explore: absence_date_ranges {
  fields: [ALL_FIELDS*, -groups.last_period_id]
  group_label: "Petal Agenda"
  join: groups {
    type: left_outer
    sql_on: ${absence_date_ranges.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: account_console_groups {
  group_label: "Petal Agenda"
  join: accounts {
    type: left_outer
    sql_on: ${account_console_groups.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: categories {
  fields: [ALL_FIELDS*, -groups.last_period_id]
  group_label: "Global"
  join: groups {
    type: left_outer
    sql_on: ${categories.group_id} = ${groups.parent_group_id} ;;
    relationship: many_to_one
  }

  join: centres {
    type: left_outer
    sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
    relationship: many_to_one
  }

  join: locations {
    type: left_outer
    sql_on: ${groups.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${groups.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}

explore: restrictions {
    group_label: "Petal Agenda"
    join: groups {
      type: left_outer
      sql_on: ${restrictions.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: schedule_events {
    group_label: "Petal Agenda"
    join: groups {
      type: left_outer
      sql_on: ${schedule_events.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${schedule_events.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: restriction_kinds {
      type: left_outer
      sql_on: ${schedule_events.restriction_kind_id} = ${restriction_kinds.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${schedule_events.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }
  }

explore: schedule_ineligibility_date_ranges {
    group_label: "Petal Agenda"
    join: memberships {
      type: left_outer
      sql_on: ${schedule_ineligibility_date_ranges.membership_id} = ${memberships.id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${memberships.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: groups {
      type: left_outer
      sql_on: ${memberships.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: settings {
      type: left_outer
      sql_on: ${memberships.setting_id} = ${settings.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }
  }

explore: simple__resources {
    group_label: "Petal Agenda"
    join: accounts {
      type: left_outer
      sql_on: ${simple__resources.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: simple__schedule_configurations {
    group_label: "Petal Agenda"
    join: groups {
      type: left_outer
      sql_on: ${simple__schedule_configurations.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: weekly_comments {
    group_label: "Petal Agenda"
    join: groups {
      type: left_outer
      sql_on: ${weekly_comments.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

#explore: category_slots_values {}

#explore: absence_report_configs_categories {}

#explore: absence_slot_kinds {}

#explore: absence_unit_combinations {}

#explore: absence_notification_actions {}

#explore: absence_report_config_templates {}

#####################################################################
# Petal Patient
#####################################################################

explore: appointments_retention_lifecycle {}

explore: active_patients {}

explore: monthly_activity_appointments {}

explore: monthly_activity_previous_appointments {}

explore: questionnaire_appointments {}

explore:  patient_users {}

explore: date_series_table_patients {}

explore: date_series_quarters {}

explore: date_series_table {

  join: health_groups_by_product {
    type: cross
  }

  join: accounts {
    type: left_outer
    sql_on: ${date_series_table.day_date_date} = ${accounts.deactivated_date} OR ${date_series_table.day_date_date} = ${accounts.confirmed_date} ;;
    relationship: one_to_many
  }

  join: account_locations {
    type: left_outer
    sql_on: ${accounts.id} = ${account_locations.account_id} ;;
    relationship: one_to_one
  }

  join: active_users {
    type: left_outer
    sql_on: ${accounts.id} = ${active_users.account_id} ;;
    relationship: one_to_one
  }

  join: active_users_scheduling {
    type: left_outer
    sql_on: ${accounts.id} = ${active_users_scheduling.account_id} ;;
    relationship: one_to_many
  }

  join: users_by_product {
    type: left_outer
    sql_on: ${users_by_product.date_serie_quarter} = ${users_by_product.date_serie_quarter} ;;
    relationship: one_to_one
  }

#   join:pati__appointments {
#     type: left_outer
#     sql_on: ${date_series_table.date_date} = ${pati__appointments.created_date} ;;
#   }
#
#   join: pati__availabilities {
#     type: inner
#     sql_on: ${pati__appointments.availability_id} = ${pati__availabilities.id} ;;
#     relationship: one_to_one
#   }
#
#   join: pati__account_tasks {
#     type: inner
#     sql_on: ${pati__availabilities.account_task_id} = ${pati__account_tasks.id} ;;
#     relationship: many_to_one
#   }
#
#   join: pati__tasks {
#     type: inner
#     sql_on: ${pati__account_tasks.task_id} = ${pati__tasks.id} ;;
#     relationship: many_to_one
#   }
#
#   join: pati__reasons {
#     type: inner
#     sql_on: ${pati__tasks.reason_id} = ${pati__reasons.id} ;;
#     relationship: many_to_one
#   }
#
#   join: clinics {
#     type: inner
#     sql_on: ${pati__reasons.group_id} = ${clinics.id} ;;
#     relationship: many_to_one
#   }
#
#   join: appointment_reminders  {
#     type: left_outer
#     sql_on: ${date_series_table.date_date} = ${appointment_reminders.sent_date_date} ;;
#   }
#
#   join: accounts {
#     view_label: "Confirmed accounts"
#     type: left_outer
#     sql_on: ${date_series_table.date_date} = ${accounts.confirmed_date} ;;
#     relationship: one_to_many
#   }
#
#   join: comments {
#     type: left_outer
#     sql_on: ${accounts.id} = ${comments.account_id} ;;
#     relationship: one_to_many
#   }
#
#   join: memberships {
#     type: left_outer
#     sql_on:  ;;
#   }

}

explore: pati__appointments {
  label: "Appointments"

  join: pati__availabilities {
    view_label: "Availabilities"
    type: inner
    relationship: one_to_one
    sql_on: ${pati__availabilities.id} = ${pati__appointments.availability_id} ;;
  }

  join: pati__account_tasks {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__availabilities.account_task_id} = ${pati__account_tasks.id};;
  }

  join: accounts {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__account_tasks.account_id} = ${accounts.id} ;;
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: pati__tasks {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__account_tasks.task_id} = ${pati__tasks.id};;
  }
  join: pati__reasons {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__tasks.reason_id} = ${pati__reasons.id};;
  }
  join: pati__offerings {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__reasons.offering_id} = ${pati__offerings.id};;
  }
  join: clinics {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__reasons.group_id} = ${clinics.id};;
  }


  join: locations {
    type: left_outer
    sql_on: ${clinics.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: location_geometries {
    type: left_outer
    sql_on: ${locations.id} = ${location_geometries.location_id} ;;
    relationship: one_to_one
  }

  join: pati__providers {
    type: inner
    relationship: one_to_one
    sql_on: ${clinics.id} = ${pati__providers.group_id} ;;
  }
  join: noti__notifications {
    type: left_outer
    relationship: one_to_many
    sql_on: ${pati__appointments.id} = ${noti__notifications.context_id} ;;
  }
}

explore: appointment_reminders {
    group_label: "Petal Patient"
    label: "Appointment Reminders"
    join: pati__appointments {
      type: inner
      sql_on: ${appointment_reminders.context_id} = ${pati__appointments.id} ;;
      relationship: many_to_one
    }

  join: pati__availabilities {
    view_label: "Availabilities"
    type: inner
    relationship: one_to_one
    sql_on: ${pati__availabilities.id} = ${pati__appointments.availability_id} ;;
  }

  join: pati__account_tasks {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__availabilities.account_task_id} = ${pati__account_tasks.id};;
  }

  join: pati__tasks {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__account_tasks.task_id} = ${pati__tasks.id};;
  }
  join: pati__reasons {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__tasks.reason_id} = ${pati__reasons.id};;
  }
  join: pati__offerings {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__reasons.offering_id} = ${pati__offerings.id};;
  }
  join: clinics {
    type: inner
    relationship: many_to_one
    sql_on: ${pati__reasons.group_id} = ${clinics.id};;
  }

  join: locations {
    type: left_outer
    sql_on: ${clinics.location_id} = ${locations.id} ;;
    relationship: many_to_one
  }

  join: location_geometries {
    type: left_outer
    sql_on: ${locations.id} = ${location_geometries.location_id} ;;
    relationship: one_to_one
  }


  }

explore: pati__account_tasks {
    group_label: "Petal Patient"
    join: accounts {
      type: left_outer
      sql_on: ${pati__account_tasks.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__appointment_check_ins {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__appointment_check_ins.group_id} = ${groups.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__availabilities {
    label: "Availabilities"
    group_label: "Petal Patient"
    join: pati__account_tasks {
      type: inner
      sql_on: ${pati__availabilities.account_task_id} = ${pati__account_tasks.id} ;;
      relationship: many_to_one
    }
    join: pati__tasks {
      type: inner
      sql_on: ${pati__account_tasks.task_id} = ${pati__tasks.id};;
      relationship: many_to_one
    }
    join: pati__reasons {
      type: inner
      sql_on: ${pati__tasks.reason_id} = ${pati__reasons.id};;
      relationship: many_to_one
    }
    join: pati__offerings {
      type: inner
      sql_on: ${pati__reasons.offering_id} = ${pati__offerings.id};;
      relationship: many_to_one
    }

    join: groups {
      type: inner
      sql_on: ${pati__reasons.group_id} = ${groups.id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: inner
      sql_on: ${pati__account_tasks.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__availability_query_logs {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__availability_query_logs.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__display_items {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__display_items.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__form_forms {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__form_forms.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__medical_notes {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__medical_notes.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__offerings {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__offerings.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__patient_statuses {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__patient_statuses.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }



    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__patients {
    group_label: "Petal Patient"
    label: "Patients"
    join: timezones {
      type: left_outer
      sql_on: ${pati__patients.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

  join: patient_users {
    type: left_outer
    sql_on: ${pati__patients.id} = ${patient_users.id} ;;
    relationship: one_to_one

  }

    join: profiles {
      type: left_outer
      sql_on: ${pati__patients.profile_id} = ${profiles.id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${profiles.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: pati__subscriptions {
      type: inner
      sql_on: ${pati__subscriptions.patient_id} = ${pati__patients.id} ;;
      relationship: many_to_one
    }

    join: groups {
      type: inner
      sql_on: ${pati__subscriptions.group_id} = ${groups.id} ;;
      relationship: many_to_one
    }

    join: pati__appointments {
      type: left_outer
      sql_on: ${pati__patients.id} = ${pati__appointments.patient_id} ;;
      relationship: one_to_many
    }
  }

explore: pati__periods {
    group_label: "Petal Patient"
    join: accounts {
      type: left_outer
      sql_on: ${pati__periods.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: groups {
      type: left_outer
      sql_on: ${pati__periods.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__profiles {
    group_label: "Petal Patient"
    join: subdivisions {
      type: left_outer
      sql_on: ${pati__profiles.subdivision_id} = ${subdivisions.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__provider_changed_items {
    join: groups {
      type: left_outer
      sql_on: ${pati__provider_changed_items.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__providers {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__providers.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__reasons {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__reasons.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__recall_list_accounts {
    group_label: "Petal Patient"
    join: accounts {
      type: left_outer
      sql_on: ${pati__recall_list_accounts.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__recall_lists {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__recall_lists.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__requests {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__requests.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__subscriptions {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__subscriptions.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: accounts {
      type: left_outer
      sql_on: ${pati__subscriptions.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: pati__patients {
      type: left_outer
      sql_on: ${pati__subscriptions.patient_id} = ${pati__patients.id} ;;
      relationship: many_to_one
    }

    join: profiles {
      type: left_outer
      sql_on: ${pati__subscriptions.profile_id} = ${profiles.id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__subscriptions_authorized_accounts {
    group_label: "Petal Patient"
    join: accounts {
      type: left_outer
      sql_on: ${pati__subscriptions_authorized_accounts.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__template_kinds {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__template_kinds.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__templates {
    group_label: "Petal Patient"
    join: accounts {
      type: left_outer
      sql_on: ${pati__templates.account_id} = ${accounts.id} ;;
      relationship: many_to_one
    }

    join: account_first_comment {
      type: left_outer
      sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
      relationship: one_to_one
    }

    join: comments {
      type: left_outer
      sql_on: ${accounts.id} = ${comments.account_id} ;;
      relationship: one_to_many
    }

    join: discussions {
      type: left_outer
      sql: ${comments.discussion_id} = ${discussions.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

explore: pati__waiting_rooms {
    group_label: "Petal Patient"
    join: groups {
      type: left_outer
      sql_on: ${pati__waiting_rooms.group_id} = ${groups.parent_group_id} ;;
      relationship: many_to_one
    }

    join: centres {
      type: left_outer
      sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
      relationship: many_to_one
    }

    join: locations {
      type: left_outer
      sql_on: ${groups.location_id} = ${locations.id} ;;
      relationship: many_to_one
    }

    join: timezones {
      type: left_outer
      sql_on: ${groups.timezone_id} = ${timezones.id} ;;
      relationship: many_to_one
    }
  }

#explore: pati__appointment_check_in_patients {}

#   explore: pati__appointment_patient_statuses {}
#
#   explore: pati__attachments {}

#   explore: pati__form_answers {}
#
#   explore: pati__form_choices {}
#
#   explore: pati__form_form_answers {}

#   explore: pati__omnimeds {}
#
#   explore: pati__patient_filters {}

#   explore: pati__form_headers {}
#
#   explore: pati__form_questions {}
#
#   explore: pati__kinlogixes {}

#   explore: pati__softinfos {}
#
#   explore: pati__standalones {}
#
#   explore: pati__subscription_links {}

#   explore: pati__task_task_fallbacks {}
#
#   explore: pati__tasks {}
#
#   explore: pati__teluses {}
#
#   explore: pati__template_items {}

#explore: pati__visibility_blocks {}

#explore: pati__waiting_room_patients {}

#explore: pati__purkinjes {}

# explore: book__notification_deliveries {
#   join: notifications {
#     type: left_outer
#     sql_on: ${book__notification_deliveries.notification_id} = ${notifications.id} ;;
#     relationship: many_to_one
#   }
#
#   join: accounts {
#     type: left_outer
#     sql_on: ${notifications.account_id} = ${accounts.id} ;;
#     relationship: many_to_one
#   }
#
#   join: account_first_comment {
#     type: left_outer
#     sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
#     relationship: one_to_one
#   }
#
#   join: comments {
#     type: left_outer
#     sql_on: ${accounts.id} = ${comments.account_id} ;;
#     relationship: one_to_many
#   }
#
#   join: discussions {
#     type: left_outer
#     sql_on: ${notifications.discussion_id} = ${discussions.id} ;;
#     relationship: many_to_one
#   }
#
#   join: notification_kinds {
#     type: left_outer
#     sql_on: ${notifications.notification_kind_id} = ${notification_kinds.id} ;;
#     relationship: many_to_one
#   }
#
#   join: timezones {
#     type: left_outer
#     sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
#     relationship: many_to_one
#   }
#
#   join: groups {
#     type: left_outer
#     sql_on: ${discussions.group_id} = ${groups.parent_group_id} ;;
#     relationship: many_to_one
#   }
#
#   join: distribution_lists {
#     type: left_outer
#     sql_on: ${discussions.distribution_list_id} = ${distribution_lists.id} ;;
#     relationship: many_to_one
#   }
#
#   join: centres {
#     type: left_outer
#     sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
#     relationship: many_to_one
#   }
#
#   join: locations {
#     type: left_outer
#     sql_on: ${groups.location_id} = ${locations.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: book__notification_template_contents {
#   join: attachments {
#     type: left_outer
#     sql_on: ${book__notification_template_contents.attachment_id} = ${attachments.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: book__notification_template_groups {
#   join: groups {
#     type: left_outer
#     sql_on: ${book__notification_template_groups.group_id} = ${groups.parent_group_id} ;;
#     relationship: many_to_one
#   }
#
#   join: centres {
#     type: left_outer
#     sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
#     relationship: many_to_one
#   }
#
#   join: locations {
#     type: left_outer
#     sql_on: ${groups.location_id} = ${locations.id} ;;
#     relationship: many_to_one
#   }
#
#   join: timezones {
#     type: left_outer
#     sql_on: ${groups.timezone_id} = ${timezones.id} ;;
#     relationship: many_to_one
#   }
# }
#
# explore: book__notification_templates {}
#
 explore: book__notifications {
   join: book__notification_deliveries {
     type: left_outer
     sql_on: ${book__notifications.id} = ${book__notification_deliveries.notification_id} ;;
     relationship: one_to_one
   }

  join: book__notification_templates {
    type: left_outer
    sql_on: ${book__notifications.template_id} = ${book__notification_templates.id} ;;
    relationship: many_to_one
  }

  join: book__notification_template_groups {
    type: left_outer
    sql_on: ${book__notification_templates.template_group_id} = ${book__notification_template_groups.created_by_id} ;;
    relationship: many_to_one
  }

  join: groups {
    type: inner
    sql_on: ${book__notification_template_groups.group_id} = ${groups.id} ;;
    relationship: many_to_one
  }

  join: book__queued_notifications {
    type: left_outer
    sql_on: ${book__notifications.queued_notification_id} = ${book__queued_notifications.id} ;;
    relationship: one_to_one
  }
 }
#
# explore: book__queued_notifications {
#   join: groups {
#     type: left_outer
#     sql_on: ${book__queued_notifications.group_id} = ${groups.parent_group_id} ;;
#     relationship: many_to_one
#   }
#
#   join: centres {
#     type: left_outer
#     sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
#     relationship: many_to_one
#   }
#
#   join: locations {
#     type: left_outer
#     sql_on: ${groups.location_id} = ${locations.id} ;;
#     relationship: many_to_one
#   }
#
#   join: timezones {
#     type: left_outer
#     sql_on: ${groups.timezone_id} = ${timezones.id} ;;
#     relationship: many_to_one
#   }
# }

#explore: assistant_notes {
#   join: accounts {
#     type: left_outer
#     sql_on: ${assistant_notes.account_id} = ${accounts.id} ;;
#     relationship: many_to_one
#   }
#
#   join: account_first_comment {
#     type: left_outer
#     sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
#     relationship: one_to_one
#   }
#
#   join: comments {
#     type: left_outer
#     sql_on: ${accounts.id} = ${comments.account_id} ;;
#     relationship: one_to_many
#   }
#
#   join: discussions {
#     type: left_outer
#     sql: ${comments.discussion_id} = ${discussions.id} ;;
#     relationship: many_to_one
#   }
#
#   join: groups {
#     type: left_outer
#     sql_on: ${assistant_notes.group_id} = ${groups.parent_group_id} ;;
#     relationship: many_to_one
#   }
#
#   join: timezones {
#     type: left_outer
#     sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
#     relationship: many_to_one
#   }
#
#   join: centres {
#     type: left_outer
#     sql_on: ${groups.centre_id} = ${centres.parent_centre_id} ;;
#     relationship: many_to_one
#   }
#
#   join: locations {
#     type: left_outer
#     sql_on: ${groups.location_id} = ${locations.id} ;;
#     relationship: many_to_one
#   }
# }

#####################################################################
# Petal Hub
#####################################################################

explore: console_content_groups {
  group_label: "Petal Hub"

  join: head_groups {
    from: groups
    sql_on: ${console_content_groups.console_group_id} = ${head_groups.id} ;;
  }

  join: console_groups {
    from: groups
    sql_on: ${console_content_groups.content_group_id} = ${console_groups.id}  ;;
  }

  join: console_access_groups {
    type: left_outer
    sql_on: ${console_content_groups.console_group_id} = ${console_access_groups.console_group_id} ;;
    relationship: one_to_many
  }

  join: group_kinds {
    type: inner
    sql_on: ${console_groups.kind_id} = ${group_kinds.id} ;;
    relationship: many_to_one
  }

  join: groups_pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.group_id} = ${console_groups.id} AND
            ((${groups_pricing_plans.start_date} IS NULL AND ${groups_pricing_plans.end_date} IS NULL) OR
            (${groups_pricing_plans.start_date} IS NULL AND ${groups_pricing_plans.end_date} >= now()) OR
            (${groups_pricing_plans.start_date} <= now() AND ${groups_pricing_plans.end_date} IS NULL) OR
            (${groups_pricing_plans.start_date} <= now() AND ${groups_pricing_plans.end_date} >= now()))
            ;;
    relationship: one_to_many
  }

join: groups_plans {
  type: left_outer
  sql_on: ${console_groups.id} = ${groups_plans.id} ;;
  relationship: one_to_one
}

  join: pricing_plans {
    type: inner
    sql_on: ${groups_pricing_plans.plan_id} = ${pricing_plans.id} ;;
    relationship: many_to_one
  }

  join: pricing_suites {
    type: inner
    sql_on: ${pricing_plans.suite_id} =  ${pricing_suites.id};;
    relationship: many_to_one
  }

  join: ip_ranges {
    type: left_outer
    sql_on: ${head_groups.id} = ${ip_ranges.group_id} ;;
    relationship: one_to_many
  }

  join: memberships {
    type: left_outer
    sql_on: ${console_groups.id} = ${memberships.group_id} ;;
    relationship: one_to_many
  }

  join: accounts {
    type: left_outer
    sql_on: ${memberships.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: head_memberships {
    from: memberships
    sql_on: ${console_content_groups.console_group_id} = ${head_memberships.group_id} ;;
    relationship: one_to_many
  }

  join: head_accounts {
    from: accounts
    type: left_outer
    sql_on: ${head_memberships.account_id} = ${head_accounts.id} ;;
    relationship: many_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql_on: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: participants {
    type: left_outer
    sql_on: ${accounts.id} = ${participants.account_id} ;;
    relationship: one_to_many
  }
}

explore: console_access_groups {
#   join: console_content_groups {
#     type: left_outer
#     sql_on: ${console_access_groups.console_group_id} = ${console_content_groups.console_group_id} ;;
#     relationship: many_to_many
#   }

  join: console_groups {
    from: groups
    type: inner
    sql_on: ${console_access_groups.console_group_id} = ${console_groups.id} ;;
    relationship: many_to_many
  }

  join: access_groups {
    from: groups
    sql_on: ${console_access_groups.access_group_id} = ${access_groups.id} ;;
    type: inner
    relationship: many_to_many
  }

  join: memberships {
    type: left_outer
    sql_on: ${access_groups.id} = ${memberships.group_id} ;;
    relationship: one_to_many
  }

  join: accounts {
    type: left_outer
    sql_on: ${memberships.id} = ${accounts.id} ;;
    relationship: many_to_one
  }
}

explore: dashboard_calls {
  group_label: "Petal Hub"
  hidden: yes
  join: accounts {
    type: left_outer
    sql_on: ${dashboard_calls.account_id} = ${accounts.id} ;;
    relationship: many_to_one
  }

  join: account_first_comment {
    type: left_outer
    sql_on: ${accounts.id} = ${account_first_comment.account_id} ;;
    relationship: one_to_one
  }

  join: comments {
    type: left_outer
    sql_on: ${accounts.id} = ${comments.account_id} ;;
    relationship: one_to_many
  }

  join: discussions {
    type: left_outer
    sql: ${comments.discussion_id} = ${discussions.id} ;;
    relationship: many_to_one
  }

  join: timezones {
    type: left_outer
    sql_on: ${accounts.timezone_id} = ${timezones.id} ;;
    relationship: many_to_one
  }
}



#explore: console_access_groups {}

#explore: console_content_groups {}

#####################################################################
# Admin
#####################################################################
