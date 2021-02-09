view: pati__offerings {
  sql_table_name: petalmd.pati__offerings ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: allow_multiple_appointments {
    type: yesno
    sql: ${TABLE}.allow_multiple_appointments ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: is_configured {
    type: yesno
    sql: ${description_fr_ca} IS NOT NULL AND
         ${description_en} IS NOT NULL AND
         ${category} IS NOT NULL;;
  }

  dimension: service_types {
    type: string
    sql: ${b_hub__service_types.description_fr_ca} ;;
  }

  measure: all_service_types {
    type: list
    list_field: service_types
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

  dimension: deactivated {
    type: yesno
    sql: ${TABLE}.deactivated ;;
  }

  dimension: description_en {
    type: string
    sql: ${TABLE}.description_en ;;
  }

  dimension: description_fr_ca {
    type: string
    sql: ${TABLE}.description_fr_ca ;;
  }

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: family_doctor_mandatory {
    type: yesno
    sql: ${TABLE}.family_doctor_mandatory ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: message_en {
    type: string
    sql: ${TABLE}.message_en ;;
  }

  dimension: message_fr_ca {
    type: string
    sql: ${TABLE}.message_fr_ca ;;
  }

  dimension: emr_service_code {
    type: string
    sql: ${TABLE}.emr_service_code ;;
  }

  dimension: emr_service_name {
    type: string
    sql: ${TABLE}.emr_service_name ;;
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

  dimension: web_offering {
    type: yesno
    sql: ${TABLE}.web_offering ;;
  }

  dimension: offering_type {
    type: string
    sql:

    CASE
      WHEN ${TABLE}.code LIKE "WALK%" THEN "Walk-in"
      WHEN ${TABLE}.code LIKE "FAMILY%" THEN "Family Doctor"
      ELSE "Other Services"
    END;;
  }

  dimension: category {
    type: number
    sql: ${TABLE}.category ;;
  }

  dimension: clean_category {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.category = 0 THEN "Présentiel"
      WHEN ${TABLE}.category = 1 THEN "Téléphonique"
      WHEN ${TABLE}.category = 2 THEN "Virtuel"
      WHEN ${TABLE}.category = 3 THEN "À domicile"
    END;;
  }

  dimension: offer_kind {
    type: string
    sql:
    CASE
      WHEN ${TABLE}.family_doctor_mandatory = 1 AND  ${TABLE}.allow_multiple_appointments = 0 THEN "MD Famille"
      WHEN ${TABLE}.family_doctor_mandatory = 0 AND  ${TABLE}.allow_multiple_appointments = 1 THEN "GMF"
      WHEN ${TABLE}.family_doctor_mandatory = 1 AND  ${TABLE}.allow_multiple_appointments = 1 THEN "MDF & GMF"
      WHEN ${TABLE}.family_doctor_mandatory = 0 AND  ${TABLE}.allow_multiple_appointments = 0 THEN "Populationnel"
    END;;
  }

  measure: count {
    type: count
    drill_fields: [id, groups.name, groups.parent_group_id]
  }
}
