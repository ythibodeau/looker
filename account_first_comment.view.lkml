view: account_first_comment {
  derived_table: {
    sql:
     SELECT
     c.account_id, MIN(c.created_at) AS first_comment
    FROM comments c
    INNER JOIN discussions d ON d.id = c.discussion_id
    WHERE d.topic_type IS NULL
    GROUP BY account_id
                   ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: first_comment {
    type: date
    sql: ${TABLE}.first_comment ;;
  }

  measure: count {
    type: count
  }

}
