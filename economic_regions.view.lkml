view: economic_regions {
  sql_table_name: petalmd.economic_regions ;;

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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
    map_layer_name: economic_regions_layer
  }

  dimension: territory_id {
    type: number
    sql: ${TABLE}.territory_id ;;
  }

  dimension: total_mds {
    type: number
    sql: CASE ${name}
           WHEN "Côte-Nord" THEN 244
           WHEN "Nord-du-Québec" THEN 179
           WHEN "Saguenay--Lac-Saint-Jean" THEN 656
           WHEN "Gaspésie--Îles-de-la-Madeleine" THEN 321
           WHEN "Bas-Saint-Laurent" THEN 534
           WHEN "Chaudière-Appalaches" THEN 813
           WHEN "Capitale-Nationale" THEN 2203
           WHEN "Mauricie" THEN 1037
           WHEN "Centre-du-Québec" THEN 1037
           WHEN "Estrie" THEN 1226
           WHEN "Lanaudière" THEN 812
           WHEN "Montérégie" THEN 2351
           WHEN "Laurentides" THEN 990
           WHEN "Laval" THEN 723
           WHEN "Montréal" THEN 6571
           WHEN "Abitibi-Témiscamingue" THEN 365
           WHEN "Outaouais" THEN 708
         ELSE 0
         END ;;
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
    drill_fields: [id, name]
  }
}
