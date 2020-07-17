view: accounts_paying_scheduling {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT A.id as account_id, ACCOUNT_GROUPS.all_group_ids, ACCOUNT_PAYING_GROUPS.paying_group_id as paying_group_id, ACCOUNT_PAYING_GROUPS.recurring_billing_type, ACCOUNT_PAYING_GROUPS.princing_plan_id as pricing_plan_id FROM (
      SELECT A.id, GROUP_CONCAT(G.id ORDER BY 1) as all_group_ids FROM accounts A
      INNER JOIN memberships M ON A.id = M.account_id
      INNER JOIN groups G ON G.id = M.group_id
      INNER JOIN groups_pricing_plans GPP ON GPP.group_id = G.id
      WHERE G.is_trial = 0 AND G.inactive = 0 AND GPP.plan_id IN (127,128,129) AND (GPP.end_date IS NULL OR GPP.end_date >= NOW())
      GROUP BY A.id
      ) ACCOUNT_GROUPS
      LEFT JOIN (
        SELECT A.id, G.id as paying_group_id, GBP.recurring_billing_type as recurring_billing_type, GPP.plan_id as princing_plan_id FROM accounts A
        LEFT JOIN account_billing_subscriptions ABS ON ABS.`account_id` = A.id
        LEFT JOIN group_billing_subscriptions GBS ON ABS.`group_billing_subscription_id` = GBS.id
        LEFT JOIN group_billing_profiles GBP ON GBP.id = GBS.group_billing_profile_id
        LEFT JOIN groups G ON G.id = GBP.group_id
        LEFT JOIN groups_pricing_plans GPP ON GPP.group_id = G.id
        WHERE (GPP.plan_id IS NULL OR GPP.plan_id IN (127,128,129)) AND (GPP.end_date IS NULL OR GPP.end_date >= NOW())
      ) ACCOUNT_PAYING_GROUPS ON ACCOUNT_PAYING_GROUPS.id = ACCOUNT_GROUPS.id
      INNER JOIN accounts A ON A.id = ACCOUNT_PAYING_GROUPS.id;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: all_group_ids {
    type: string
    sql: ${TABLE}.all_group_ids ;;
  }

  dimension: paying_group_id {
    type: number
    sql: ${TABLE}.paying_group_id ;;
  }

  dimension: paying_group_acronym {
    type: string
    sql: ${paying_groups.acronym} ;;
  }

  dimension: recurring_billing_type {
    type: number
    sql: ${TABLE}.recurring_billing_type ;;
  }

  dimension: readable_recurring_billing_type {
    type: string
    sql: CASE
           WHEN ${TABLE}.recurring_billing_type = 0 THEN "{{ _localization['billing_type.disabled'] }}"
           WHEN ${TABLE}.recurring_billing_type = 1 THEN "{{ _localization['billing_type.paid_by_one'] }}"
           WHEN ${TABLE}.recurring_billing_type = 2 THEN "{{ _localization['billing_type.paid_by_all'] }}"
           WHEN ${TABLE}.recurring_billing_type = 3 THEN "{{ _localization['billing_type.paid_by_hospital'] }}"
         END;;
  }

  dimension: billing_kind {
    type: string
    sql: CASE
           WHEN ${TABLE}.recurring_billing_type = 0 THEN "{{ _localization['billing_type.disabled'] }}"
           WHEN ${TABLE}.recurring_billing_type IN (1,2) THEN "B2C"
           WHEN ${TABLE}.recurring_billing_type = 3 THEN "B2B"
         END ;;
  }


  dimension: pricing_plan_id {
    type: number
    sql: ${TABLE}.pricing_plan_id ;;
  }

  set: detail {
    fields: [
      accounts.id,
      accounts.first_name,
      accounts.last_name,
      accounts.state_nice,
      accounts.last_active_date,
      accounts.simplified_kind,
      accounts.created_date,
      accounts.activated_date,
      accounts.confirmed_date,
      paying_groups.acronym,
      accounts.groups_acronym,
      accounts.institutions
    ]
  }
}
