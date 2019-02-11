view: pati__profiles {
  sql_table_name: petalmd.pati__profiles ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: known_allergies {
    type: string
    sql: ${TABLE}.known_allergies ;;
  }

  dimension: known_illnesses {
    type: string
    sql: ${TABLE}.known_illnesses ;;
  }

  dimension_group: last_updated {
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
    sql: ${TABLE}.last_updated_at ;;
  }

  dimension: last_updated_by_id {
    type: number
    sql: ${TABLE}.last_updated_by_id ;;
  }

  dimension: last_updated_by_type {
    type: string
    sql: ${TABLE}.last_updated_by_type ;;
  }

  dimension: locale {
    type: string
    sql: ${TABLE}.locale ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: subdivision_country_override {
    type: string
    sql: ${TABLE}.subdivision_country_override ;;
  }

  dimension: subdivision_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.subdivision_id ;;
  }

  dimension: subdivision_override {
    type: string
    sql: ${TABLE}.subdivision_override ;;
  }

  dimension: territory_id {
    type: number
    sql: ${TABLE}.territory_id ;;
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
    drill_fields: [id, subdivisions.name, subdivisions.id]
  }
}