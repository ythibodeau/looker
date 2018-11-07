view: _task_kind_subsets_sche__task_kinds {
  sql_table_name: petalmd_development.sche__task_kind_subsets_sche__task_kinds ;;

  dimension: task_kind_id {
    type: number
    sql: ${TABLE}.task_kind_id ;;
  }

  dimension: task_kind_subset_id {
    type: number
    sql: ${TABLE}.task_kind_subset_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
