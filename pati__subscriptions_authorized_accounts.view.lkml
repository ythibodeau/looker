view: pati__subscriptions_authorized_accounts {
  sql_table_name: petalmd_development.pati__subscriptions_authorized_accounts ;;

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: subscription_id {
    type: number
    sql: ${TABLE}.subscription_id ;;
  }

  measure: count {
    type: count
    drill_fields: [accounts.id, accounts.username, accounts.first_name, accounts.middle_name, accounts.last_name]
  }
}
