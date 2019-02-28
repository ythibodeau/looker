view: account_kind_distribution_lists {
  sql_table_name: petalmd.account_kind_distribution_lists ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_kind_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.account_kind_id ;;
  }

  dimension: list_id {
    type: number
    sql: ${TABLE}.list_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, account_kinds.id]
  }
}