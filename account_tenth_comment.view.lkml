view: account_tenth_comment {
  derived_table: {
    sql: SELECT
      C.id,
      C.account_id,
      A.confirmed_at,
      C.created_at
      FROM comments C
      INNER JOIN (
      SELECT SUBSTRING_INDEX(SUBSTRING_INDEX(GROUP_CONCAT(C.id ORDER BY id ASC), ',', 10), ',', -1) as comment_id
      FROM comments C
      INNER JOIN (
        SELECT C.account_id AS account_id,
               C.id AS comment_id,
               A.confirmed_at AS confirmed_at,
               C.created_at AS created_at
        FROM comments C
        INNER JOIN discussions D ON D.id = C.discussion_id
        INNER JOIN accounts A ON A.id = C.account_id
        WHERE D.topic_type IS NULL
        GROUP BY C.account_id
        HAVING COUNT(*) >=10
      ) COM ON COM.account_id = C.account_id
      WHERE COM.created_at > COM.confirmed_at
      GROUP BY C.account_id
      ) LAST_COM ON LAST_COM.comment_id = C.id
      INNER JOIN accounts A on A.id = C.account_id;
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
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

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: days_to_ten {
    type: number
    sql: TIMESTAMPDIFF(DAY, ${TABLE}.confirmed_at, ${TABLE}.created_at) ;;
  }

  set: detail {
    fields: [id, account_id, confirmed_at_time, created_at_time]
  }
}
