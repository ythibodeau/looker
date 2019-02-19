view: centres {
  sql_table_name: petalmd.centres ;;

  dimension: parent_centre_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.parent_centre_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
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

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  dimension: cohort {
    type: string
    sql:
     CASE
        WHEN ${id} IN (20, 278, 266, 260) THEN "COHORT A"
        WHEN ${id} IN (175, 21, 170, 302, 290, 112, 263, 269) THEN "COHORT B"
        ELSE "COHORT C"
      END;;
      html:
      {% if value == "COHORT A" %}
        <p style="color: #c3933a; background-color: #fdf6c7; font-size:100%; text-align:center;">{{ rendered_value }}</p>
      {% elsif value == 'COHORT B' %}
        <p style="color: #aaaaaa; background-color: #dddddd; font-size:100%; text-align:center">{{ rendered_value }}</p>
      {% else %}
        <p style="color: #a86048; background-color: #ddb2a6; font-size:100%; text-align:center">{{ rendered_value }}</p>
       {% endif %}

      ;;
  }



  measure: count {
    type: count
    drill_fields: [parent_centre_id, name, groups.count]
  }
}