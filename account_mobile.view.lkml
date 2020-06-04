view: account_mobile {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT account_id,
       CASE
      WHEN SUBSTRING_INDEX(mobile_devices.device_token, '-', 1) = "android" THEN "Android"
      WHEN SUBSTRING_INDEX(mobile_devices.device_token, '-', 1) = "iphone" THEN "iOS"
      ELSE mobile_devices.device_token
    END as os,
     MAX(created_at)
     from mobile_devices
group by account_id
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: os {
    type: string
    sql: ${TABLE}.os ;;
  }

  dimension_group: maxcreated_at {
    type: time
    sql: ${TABLE}.`MAX(created_at)` ;;
  }

  set: detail {
    fields: [account_id, os, maxcreated_at_time]
  }
}
