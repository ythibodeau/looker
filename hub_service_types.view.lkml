# Warning! This is auto-generated SQL & LookML, generated by csv-sql.web.app.
# Doublecheck the dimensions and their datatypes and adjust where necessary.

# explore: csv_to_sql_query {}

view: hub_service_types {
  derived_table: {
    sql:
      SELECT
        1 AS id, 'Urgence Mineure' AS name
      UNION ALL
      SELECT
        2 AS id, 'Consultation Prioritaire' AS name
      UNION ALL
      SELECT
        3 AS id, 'Suivi Périodique ou Préventif' AS name
      UNION ALL
      SELECT
        4 AS id, 'Suivi régulier' AS name
      UNION ALL
      SELECT
        5 AS id, 'Suivi de grossesse' AS name
      UNION ALL
      SELECT
        6 AS id, 'Suivi d'un enfant de 0 à 5 ans' AS name

      ;;
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
  }
}
