view: messages {
  derived_table: {
    datagroup_trigger: messages_health
    indexes: ["messages_key"]
    sql: SELECT
      CONCAT("CHAT", "-", CAST(m.id as CHAR)) as messages_key,
      "CHAT" as message_type,
      m.id   as type_id,
      a.id as account_id,
      m.created_at as message_date,
      m.message_type as urgent,
      m.id as parent_id
      FROM mess__messages m
      INNER JOIN mess__conversers c on c.id = m.converser_id
      INNER JOIN accounts a on a.id = c.account_id
      WHERE m.message_type IN (0,1) and CONVERT_TZ(m.created_at ,'UTC','America/New_York') >= '2019-10-22 00:00:00' /* m.created_at >= '2019-10-22' */
      UNION
      SELECT
      CONCAT("COMM", "-", CAST(c.id as CHAR)) as messages_key,
      "COMM" as message_type,
      c.id as type_id,
      a.id as account_id,
      c.created_at as message_date,
      d.urgent as urgent,
      d.id as parent_id
      FROM comments c
      INNER JOIN accounts a on a.id = c.account_id
      INNER JOIN (select * from discussions d where d.topic_type IS NULL and YEAR(d.created_at) >= 2019) d ON d.id = c.discussion_id
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
    drill_fields: [detail*]
  }

  measure: count_communication {
    type: count_distinct
    sql: ${TABLE}.type_id ;;
    filters: {
      field: message_type
      value: "COMM"
    }
    drill_fields: [detail*]
  }

  measure: count_unique_account {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
  }

  measure: count_unique_account_doctor {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
    filters: {
      field: accounts.simplified_kind
      value: "Doctor"
    }
  }

  measure: count_unique_account_chat {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
    filters: {
      field: message_type
      value: "CHAT"
    }
    drill_fields: [detail*]
  }

  measure: count_unique_account_comm {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
    filters: {
      field: message_type
      value: "COMM"
    }
    drill_fields: [detail*]
  }

  dimension: messages_key {
    primary_key: yes
    sql: ${TABLE}.messages_key  ;;
  }

  dimension: message_type {
    type: string
    sql: ${TABLE}.message_type ;;
  }

  dimension: readable_message_type {
    label: "readable_message_type"
    type: string
    sql: CASE
           WHEN ${TABLE}.message_type = "CHAT" THEN "{{ _localization['message_type_chat'] }}"
           WHEN ${TABLE}.message_type = "COMM" THEN "{{ _localization['message_type_comm'] }}"
         END
         ;;
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
    label: "messages.urgent"
    type: yesno
    sql: ${TABLE}.urgent ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: pre_new_messaging {
    type: yesno
    sql: ${TABLE}.message_date < '2019-10-22' ;;
  }


  set: detail {
    fields: [
      readable_message_type,
      accounts.first_name,
      accounts.last_name,
      message_date_time,
      accounts.groups_acronym,
      accounts.institutions,
      urgent,
    ]
  }
}
