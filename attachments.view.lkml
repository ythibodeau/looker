view: attachments {
  sql_table_name: petalmd.attachments ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: attachable_id {
    type: number
    sql: ${TABLE}.attachable_id ;;
  }

  dimension: attachable_type {
    type: string
    sql: ${TABLE}.attachable_type ;;
  }

  dimension: content_type {
    type: string
    sql: ${TABLE}.content_type ;;
  }

  dimension: clean_content_type {
    type: string
    sql:
    CASE
      WHEN ${content_type} LIKE "%powerpoint%" OR ${content_type} LIKE "%pres%" THEN "MS PowerPoint"
      WHEN ${content_type} LIKE "%pdf%" THEN "PDF"
      WHEN ${content_type} LIKE "%word%" THEN "MS Word"
      WHEN ${content_type} LIKE "%spre%" OR ${content_type} LIKE "excel" THEN "MS Excel"
      WHEN ${content_type} LIKE "%zip%" THEN "ZIP file"
      WHEN ${content_type} LIKE "%image%" THEN "Image"
      WHEN ${content_type} LIKE "%audio%" THEN "Audio"
      ELSE "Other"
    END

    ;;
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

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: deleted {
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
    sql: ${TABLE}.deleted_at ;;
  }

  dimension: file {
    type: string
    sql: ${TABLE}.file ;;
  }

  dimension: file_tmp {
    type: string
    sql: ${TABLE}.file_tmp ;;
  }

  dimension: guid {
    type: string
    sql: ${TABLE}.guid ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: tag {
    type: string
    sql: ${TABLE}.tag ;;
  }

  dimension: thumbnail {
    type: string
    sql: ${TABLE}.thumbnail ;;
  }

  dimension: thumbnail_tmp {
    type: string
    sql: ${TABLE}.thumbnail_tmp ;;
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
    drill_fields: [id, name, book__notification_template_contents.count]
  }
}
