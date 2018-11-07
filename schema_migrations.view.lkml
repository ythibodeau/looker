view: schema_migrations {
  sql_table_name: petalmd_development.schema_migrations ;;

  dimension: version {
    type: string
    sql: ${TABLE}.version ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
