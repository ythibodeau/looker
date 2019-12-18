view: sche__change_requests {
  sql_table_name: petalmd.sche__change_requests ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: acceptance_required {
    type: yesno
    sql: ${TABLE}.acceptance_required ;;
  }

  dimension: accepted {
    type: yesno
    sql: ${TABLE}.accepted ;;
  }

  dimension_group: accepted {
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
    sql: ${TABLE}.accepted_at ;;
  }

  dimension: accepted_by_id {
    type: number
    sql: ${TABLE}.accepted_by_id ;;
  }

  dimension: approval_required {
    type: yesno
    sql: ${TABLE}.approval_required ;;
  }

  dimension: approved {
    type: yesno
    sql: ${TABLE}.approved ;;
  }

  dimension_group: approved {
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
    sql: ${TABLE}.approved_at ;;
  }

  dimension: approved_by_id {
    type: number
    sql: ${TABLE}.approved_by_id ;;
  }

  dimension: assigned_to_id {
    type: number
    sql: ${TABLE}.assigned_to_id ;;
  }

  dimension: bypassed {
    type: yesno
    sql: ${TABLE}.bypassed ;;
  }

  dimension_group: bypassed {
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
    sql: ${TABLE}.bypassed_at ;;
  }

  dimension: bypassed_by_id {
    type: number
    sql: ${TABLE}.bypassed_by_id ;;
  }

  dimension: cancellation_reason {
    type: number
    sql: ${TABLE}.cancellation_reason ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension_group: cancelled {
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
    sql: ${TABLE}.cancelled_at ;;
  }

  dimension: cancelled_by_id {
    type: number
    sql: ${TABLE}.cancelled_by_id ;;
  }

  dimension: completed {
    type: yesno
    sql: ${TABLE}.completed ;;
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

  dimension: executed {
    type: yesno
    sql: ${TABLE}.executed ;;
  }

  dimension_group: executed {
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
    sql: ${TABLE}.executed_at ;;
  }

  dimension: executed_by_id {
    type: number
    sql: ${TABLE}.executed_by_id ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: initiated {
    type: yesno
    sql: ${TABLE}.initiated ;;
  }

  dimension_group: initiated {
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
    sql: ${TABLE}.initiated_at ;;
  }

  dimension: initiated_by_id {
    type: number
    sql: ${TABLE}.initiated_by_id ;;
  }

  dimension: is_exchange_v2 {
    type: yesno
    sql: ${TABLE}.is_exchange_v2 ;;
  }

  dimension: is_marketplace {
    type: yesno
    sql: ${TABLE}.is_marketplace ;;
  }

  dimension: is_winning_offer {
    type: yesno
    sql: ${TABLE}.is_winning_offer ;;
  }

  dimension: multiple_link {
    type: string
    sql: ${TABLE}.multiple_link ;;
  }

  dimension: offer_kind_id {
    type: number
    sql: ${TABLE}.offer_kind_id ;;
  }

  dimension: parent_request_id {
    type: number
    sql: ${TABLE}.parent_request_id ;;
  }

  dimension: process_moment_id {
    type: number
    sql: ${TABLE}.process_moment_id ;;
  }

  dimension: processed {
    type: yesno
    sql: ${TABLE}.processed ;;
  }

  dimension_group: processed {
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
    sql: ${TABLE}.processed_at ;;
  }

  dimension: processed_by_id {
    type: number
    sql: ${TABLE}.processed_by_id ;;
  }

  dimension: request_information_dump {
    type: string
    sql: ${TABLE}.request_information_dump ;;
  }

  dimension: timezone_id {
    type: number
    sql: ${TABLE}.timezone_id ;;
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

  dimension: is_executed_by_md  {
    type: yesno
    sql: ${accounts.kind_id} = 1 ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: count_distinct_executed_by {
    type: count_distinct
    sql: ${executed_by_id} ;;
  }

  measure: distinct_mlinks_count {
    type: count_distinct
    sql: ${multiple_link} ;;
  }

  measure: distinct_one_one_count {
    type: count_distinct
    sql: ${id} ;;
    filters: {
      field: multiple_link
      value: "NULL"
    }
  }

  measure: completed_change_request_count {
    label: "Executed Change Request"
    type: count_distinct
    filters: {
      field: executed
      value: "1"
    }
  }

  measure: initiated_by_md_count  {
    label: "Initiated by MD"
    type: count
    filters: {
      field: is_executed_by_md
      value: "Yes"
    }
    filters: {
      field: is_marketplace
      value: "No"
    }

  }

  measure: initiated_by_admin_count  {
    label: "Initiated by Admin"
    type: count
    filters: {
      field: is_executed_by_md
      value: "No"
    }
    filters: {
      field: is_marketplace
      value: "No"
    }

  }

  measure: marketplace_count {
    label: "Marketplace offer count"
    type: count
    filters: {
      field: is_marketplace
      value: "Yes"
    }
  }

}
