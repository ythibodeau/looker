view: participants {
  sql_table_name: petalmd.participants ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
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

  dimension: discussion_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.discussion_id ;;
  }

  dimension: flagged {
    type: yesno
    sql: ${TABLE}.flagged ;;
  }

  dimension: hidden {
    type: yesno
    sql: ${TABLE}.hidden ;;
  }

  dimension_group: last_read {
    label: "date"
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
    sql: ${TABLE}.last_read_at ;;
  }

  dimension: read {
    type: yesno
    sql: ${TABLE}.`read` ;;
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
    drill_fields: [detail*]
  }

  measure: count_discussions {
    type: count_distinct
    sql: ${discussion_id} ;;
  }

  measure: count_distinct_accounts {
    label: "accounts"
    type: count_distinct
    sql: ${account_id} ;;
    drill_fields: [detail*]
  }

  measure: count_read {
    type: count
    sql: ${TABLE}.`read` IS TRUE ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      accounts.first_name,
      accounts.last_name,
      accounts.groups_acronym,
      accounts.institutions,
    ]
  }
}
