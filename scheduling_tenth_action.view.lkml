view: scheduling_tenth_action {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
      M.id,
      M.account_id,
      A.confirmed_at,
      M.action_date
      FROM ${scheduling_actions.SQL_TABLE_NAME} M
      INNER JOIN (
      SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(M.id ORDER BY M.id ASC), ',', 10), ',', -1) as id
      FROM ${scheduling_actions.SQL_TABLE_NAME} M
      INNER JOIN (
        SELECT
      M.id,
      M.account_id,
      A.confirmed_at,
      M.action_date
        FROM ${scheduling_actions.SQL_TABLE_NAME} M
        INNER JOIN accounts A ON A.id = M.account_id
        GROUP BY M.account_id
        HAVING COUNT(*) >=10
      ) COM ON COM.account_id = M.account_id
      WHERE COM.action_date > COM.confirmed_at
      GROUP BY M.account_id
      ) LAST_COM ON LAST_COM.id = M.id
      INNER JOIN accounts A on A.id = M.account_id ;
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: confirmed_at {
    type: time
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension: action_date {
    type: string
    sql: ${TABLE}.action_date ;;
  }

  dimension: days_to_ten {
    type: number
    sql: TIMESTAMPDIFF(DAY, ${TABLE}.confirmed_at, ${TABLE}.action_date) ;;
  }

  measure: cohort_size_reached {
    type: count_distinct
    sql: ${account_id} ;;
  }

  measure: average_time_to_10 {
    type: average
    sql: ${days_to_ten}  ;;
    value_format: "###"
  }

  set: detail {
    fields: [id, account_id, confirmed_at_time, action_date]
  }
}
