view: account_billing_subscriptions {
  sql_table_name: petalmd.account_billing_subscriptions ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: group_billing_subscription_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_billing_subscription_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, group_billing_subscriptions.id]
  }
}
