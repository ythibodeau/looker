view: book__notification_templates {
  sql_table_name: petalmd.book__notification_templates ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: media {
    type: number
    sql: ${TABLE}.media ;;
  }

  dimension: clean_media {
    type: string
    sql:

    CASE
      WHEN ${TABLE}.media = 0 THEN "Email"
      WHEN ${TABLE}.media = 1 THEN "SMS"
      WHEN ${TABLE}.media = 2 THEN "Phone"
    END
    ;;
  }


  dimension: template_group_id {
    type: number
    sql: ${TABLE}.template_group_id ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
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
    drill_fields: [id]
  }
}
