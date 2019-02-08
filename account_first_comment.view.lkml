view: account_first_comment {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql:
     SELECT
       C.account_id,
       A.confirmed_at AS confirmed_at,
       MIN(C.created_at) AS first_comment,
       TIMESTAMPDIFF(DAY, A.confirmed_at, MIN(C.created_at)) as first_usage_delay
    FROM comments C
    INNER JOIN discussions D ON D.id = C.discussion_id
    INNER JOIN accounts A ON A.id = C.account_id
    WHERE D.topic_type IS NULL
    -- AND A.confirmed_at IS NOT NULL
    GROUP BY account_id;
                   ;;
  }

  dimension: account_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: confirmed_at {
    type: date
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension: confirmed_at_year {
    type: date_year
    sql: ${TABLE}.confirmed_at ;;
  }

  dimension: confirmed_at_month {
    type: number
    sql: MONTH(${TABLE}.confirmed_at) ;;
  }

  dimension: first_comment {
    type: date
    sql: ${TABLE}.first_comment ;;
  }

  dimension: first_comment_year {
    type: date_year
    sql: ${TABLE}.first_comment ;;
  }

  dimension: first_comment_month {
    type: number
    sql: MONTH(${TABLE}.first_comment) ;;
  }

  dimension: first_usage_delay {
    type: number
    sql: ${TABLE}.first_usage_delay   ;;
  }

  measure: count {
    type: count
  }

  measure: first_usage_less_15days {
    type: count
    filters: {
      field: first_usage_delay
      value: "< 15"
    }
  }

  measure: first_usage_less_30days {
    type: count
    filters: {
      field: first_usage_delay
      value: ">=15 AND <30"
    }
  }

  measure: first_usage_less_60days {
    type: count
    filters: {
      field: first_usage_delay
      value: ">=30 AND <60"
    }
  }

  measure: first_usage_less_90days {
    type: count
    filters: {
      field: first_usage_delay
      value: ">=60 AND <90"
    }
  }

  measure: first_usage_less_180days {
    type: count
    filters: {
      field: first_usage_delay
      value: ">=90 AND <180"
    }
  }

  measure: first_usage_less_365days {
    type: count
    filters: {
      field: first_usage_delay
      value: ">=180 AND <365"
    }
  }

  measure: first_usage_more_365days {
    type: count
    filters: {
      field: first_usage_delay
      value: ">=365"
    }
  }

  measure: unique_accounts_cohort_count {
    type: count_distinct
    sql: ${account_id} ;;
  }

  measure: first_usage_delay_average {
    type: average
    value_format: "###"
    sql: ${first_usage_delay} ;;
  }


}
