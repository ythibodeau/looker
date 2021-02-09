view: mask_data {
  sql_table_name: petalmd.mask_data ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_date ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}