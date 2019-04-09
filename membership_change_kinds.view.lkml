view: membership_change_kinds {
  sql_table_name: petalmd.membership_change_kinds ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: mnemonic {
    type: string
    sql: ${TABLE}.mnemonic ;;
  }

  dimension: simplified_mnemonic {
    type: string
    sql: CASE
          WHEN ${TABLE}.id = 1 THEN "Added"
          WHEN ${TABLE}.id = 2 THEN "Removed"
          WHEN ${TABLE}.id = 3 THEN "Activated"
          WHEN ${TABLE}.id = 4 THEN "Deactivated"
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
    drill_fields: [id]
  }
}
