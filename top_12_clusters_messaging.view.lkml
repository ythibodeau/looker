view: top_12_clusters_messaging {
  derived_table: {
    sql: SELECT
        health_clusters.name  AS `health_clusters.name`,
        health_clusters.id  AS `health_clusters.id`,
        COUNT(DISTINCT CASE WHEN discussions.topic_type IS NULL  THEN comments.id  ELSE NULL END) AS `comments.regular_count`
      FROM petalmd.health_clusters  AS health_clusters
      LEFT JOIN petalmd.health_institutions  AS health_institutions ON health_clusters.id = health_institutions.health_cluster_id
      LEFT JOIN petalmd.groups  AS groups ON health_institutions.id = groups.health_institution_id
      LEFT JOIN petalmd.memberships  AS memberships ON groups.id = memberships.group_id
      LEFT JOIN petalmd.accounts  AS accounts ON memberships.account_id = accounts.id
      LEFT JOIN petalmd.comments  AS comments ON accounts.id = comments.account_id
      LEFT JOIN petalmd.discussions  AS discussions ON comments.discussion_id = discussions.id

      WHERE
        (((comments.created_at ) >= ((CONVERT_TZ(DATE_ADD(DATE(CONVERT_TZ(NOW(),'UTC','America/New_York')),INTERVAL -30 day),'America/New_York','UTC'))) AND (comments.created_at ) < ((CONVERT_TZ(DATE_ADD(DATE_ADD(DATE(CONVERT_TZ(NOW(),'UTC','America/New_York')),INTERVAL -30 day),INTERVAL 30 day),'America/New_York','UTC')))))
      GROUP BY 1,2
      ORDER BY COUNT(DISTINCT CASE WHEN discussions.topic_type IS NULL  THEN comments.id  ELSE NULL END) DESC
      LIMIT 12
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: health_clusters_name {
    type: string
    sql: ${TABLE}.`health_clusters.name` ;;
  }

  dimension: health_clusters_id {
    type: number
    sql: ${TABLE}.`health_clusters.id` ;;
  }

  measure: comments_regular_count {
    type: number
    sql: ${TABLE}.`comments.regular_count` ;;
  }

  set: detail {
    fields: [health_clusters_name, health_clusters_id, comments_regular_count]
  }
}
