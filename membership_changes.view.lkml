view: membership_changes {
  sql_table_name: petalmd.membership_changes ;;

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
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: kind_id {
    type: number
    sql: ${TABLE}.kind_id ;;
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

  dimension: simplified_mnemonic {
    type: string
    sql: CASE
          WHEN ${TABLE}.kind_id = 1 THEN "Added"
          WHEN ${TABLE}.kind_id = 2 THEN "Removed"
          WHEN ${TABLE}.kind_id = 3 THEN "Activated"
          WHEN ${TABLE}.kind_id = 4 THEN "Deactivated"
         END;;
    html:

    {% if value == "Added" %}
      <p style="color: #ffffff; background-color:#72D16D ; font-size:100%; text-align:center;">{{ rendered_value }}</p>
    {% elsif value == "Removed" %}
      <p style="color: #ffffff; background-color:#B32F37 ; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value == "Activated" %}
     <p style="color: #ffffff; background-color: #3EB0D5; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="color: #ffffff; background-color: gray; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      groups.name,
      groups.parent_group_id,
      accounts.id,
      accounts.username,
      accounts.first_name,
      accounts.middle_name,
      accounts.last_name
    ]
  }
}
