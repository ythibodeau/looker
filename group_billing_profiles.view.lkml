view: group_billing_profiles {
  sql_table_name: petalmd.group_billing_profiles ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: billing_first {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.billing_first_date ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
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

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  measure: count {
    type: count
    drill_fields: [id, group_billing_subscriptions.count]
  }
}
