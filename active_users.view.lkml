# If necessary, uncomment the line below to include explore_source.
# include: "test_yves.model.lkml"

view: active_users {
  derived_table: {
    explore_source: comments {
      column: created_date {}
      column: account_id {}
      filters: {
        field: discussions.topic_type
        value: "NULL"
      }
      filters: {
        field: comments.count
        value: ">0"
      }
    }
  }
  dimension_group: created_date {
    type: time
    timeframes: [date,month]
  }
  dimension: account_id {
    type: number
  }
  measure: count_of_active_users {
    type: count_distinct
    sql: ${account_id} ;;
  }
}
