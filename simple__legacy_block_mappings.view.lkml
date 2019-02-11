view: simple__legacy_block_mappings {
  sql_table_name: petalmd.simple__legacy_block_mappings ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: block_id {
    type: number
    sql: ${TABLE}.block_id ;;
  }

  dimension: block_kind_id {
    type: number
    sql: ${TABLE}.block_kind_id ;;
  }

  dimension: legacy_abbreviation {
    type: string
    sql: ${TABLE}.legacy_abbreviation ;;
  }

  dimension: period_id {
    type: number
    sql: ${TABLE}.period_id ;;
  }

  dimension: schedule_configuration_id {
    type: number
    sql: ${TABLE}.schedule_configuration_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}