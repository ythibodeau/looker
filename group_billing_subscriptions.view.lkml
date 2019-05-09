view: group_billing_subscriptions {
  sql_table_name: petalmd.group_billing_subscriptions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: group_billing_profile_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_billing_profile_id ;;
  }

  dimension: payer_account_id {
    type: number
    sql: ${TABLE}.payer_account_id ;;
  }

  dimension: subscription_id {
    type: string
    sql: ${TABLE}.subscription_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, group_billing_profiles.id, account_billing_subscriptions.count]
  }
}
