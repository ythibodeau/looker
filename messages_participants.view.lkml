view: messages_participants {
  derived_table: {
    sql: SELECT
      CONCAT("COMM-",CAST(participants.id as CHAR), "-", CAST(participants.account_id as CHAR)) as unique_id,
              "COMM" as message_type,
        participants.account_id  AS account_id,
        CASE WHEN participants.`read`  THEN 'Yes' ELSE 'No' END
       AS is_read,
        DATE(CONVERT_TZ(participants.last_read_at ,'UTC','America/New_York')) AS last_read_date
      FROM petalmd.participants  AS participants
      LEFT JOIN petalmd.discussions  AS discussions ON participants.discussion_id = discussions.id

      WHERE
        ((discussions.topic_type IS NULL))
        UNION
        SELECT
               CONCAT("CHAT-",CAST(mess__converser_messages.id as CHAR), "-", CAST(accounts.id as CHAR)) as unique_id,
              "CHAT" as message_type,
        DATE(CONVERT_TZ(mess__converser_messages.read_at ,'UTC','America/New_York')) AS last_read_date,
        CASE WHEN mess__converser_messages.`read`  THEN 'Yes' ELSE 'No' END as is_read,
        accounts.id  AS account_id
      FROM petalmd.mess__converser_messages  AS mess__converser_messages
      INNER JOIN petalmd.mess__conversers  AS mess__conversers ON mess__converser_messages.converser_id = mess__conversers.id
      INNER JOIN petalmd.accounts  AS accounts ON mess__conversers.account_id = accounts.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: message_type {
    type: string
    sql: ${TABLE}.message_type ;;
  }

  dimension: account_id {
    type: string
    sql: ${TABLE}.account_id ;;
  }

  dimension: is_read {
    type: string
    sql: ${TABLE}.is_read ;;
  }

  dimension: last_read_date {
    type: string
    sql: ${TABLE}.last_read_date ;;
  }

  set: detail {
    fields: [unique_id, message_type, account_id, is_read, last_read_date]
  }
}
