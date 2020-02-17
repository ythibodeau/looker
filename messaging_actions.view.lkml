view: messaging_actions {
  derived_table: {
    indexes: ["account_id", "action_date"]
    sql_trigger_value: SELECT CURDATE() ;;
    sql:        select (@row_number:=@row_number + 1) AS id,
       x.account_id as account_id,
       x.action as action,
       x.action_date as action_date
       FROM
       (SELECT @row_number:=0) AS t, (
       SELECT m.account_id as account_id,
       "write_message" as action,
       DATE_FORMAT(m.message_date, '%Y-%m-%d') as action_date
FROM ${messages.SQL_TABLE_NAME} m
UNION
SELECT p.account_id,
       "read_comm" as action,
       DATE_FORMAT(p.last_read_at, '%Y-%m-%d') as action_date
FROM participants p
UNION
SELECT c.account_id,
       "read_chat" as action,
       DATE_FORMAT(mc.read_at, '%Y-%m-%d') as action_date
FROM mess__converser_messages mc
INNER JOIN mess__conversers c on c.id = mc.converser_id) as x
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_distinct_account_id {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }


  dimension: account_id {
    type: number
    sql: ${TABLE}.account_id ;;
  }

  dimension: action {
    type: string
    sql: ${TABLE}.action ;;
  }

  dimension: action_date {
    type: string
    sql: ${TABLE}.action_date ;;
  }

  set: detail {
    fields: [account_id, action, action_date]
  }
}
