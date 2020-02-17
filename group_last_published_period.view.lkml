view: group_last_published_period {
#   # Or, you could make this view a derived table, like this:
    derived_table: {
      sql_trigger_value: SELECT CURDATE() ;;
      sql:
      SELECT g.id as group_id,
             MAX(p.id) as period_id
      FROM groups g
      LEFT JOIN sche__periods p
      ON g.id = p.group_id
      WHERE p.state = 'confirmed'
      GROUP BY g.id
            ;;
    }

    dimension: group_id {
      type: number
      sql: ${TABLE}.group_id ;;
    }

    dimension: period_id {
      type: number
      sql: ${TABLE}.period_id ;;
    }
  }
