view: messages {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT
      "CHAT" as message_type,
      m.id   as type_id,
      a.id as account_id,
      m.created_at as message_date,
      m.message_type as urgent,
      m.id as parent_id
      FROM mess__messages m
      INNER JOIN mess__converser_messages cm ON cm.id = m.id
      INNER JOIN mess__conversers c on c.id = cm.converser_id
      INNER JOIN accounts a on a.id = c.account_id
      WHERE m.message_type IN (0,1)
      UNION
      SELECT
      "COMM" as message_type,
      c.id as type_id,
      a.id as account_id,
      c.created_at as message_date,
      d.urgent as urgent,
      d.id as parent_id
      FROM comments c
      INNER JOIN accounts a on a.id = c.account_id
      INNER JOIN discussions d on d.id = c.discussion_id
      WHERE d.topic_type IS NULL
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_chat {
    type: count_distinct
    sql: ${TABLE}.type_id ;;
    filters: {
      field: message_type
      value: "CHAT"
    }
  }

  measure: count_communication {
    type: count_distinct
    sql: ${TABLE}.type_id ;;
    filters: {
      field: message_type
      value: "COMM"
    }
  }

  dimension: primary_key {
    primary_key: yes
    sql: CONCAT(${TABLE}.type_id, ${TABLE}.message_type) ;;
  }

  dimension: message_type {
    type: string
    sql: ${TABLE}.message_type ;;
  }

  dimension: type_id {
    type: number
    sql: ${TABLE}.type_id ;;
  }

  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension_group: message_date {
    type: time
    sql: ${TABLE}.message_date ;;
  }

  dimension: urgent {
    type: number
    sql: ${TABLE}.urgent ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }


  set: detail {
    fields: [
      message_type,
      type_id,
      account_id,
      message_date_time,
      urgent,
      parent_id
    ]
  }
}
