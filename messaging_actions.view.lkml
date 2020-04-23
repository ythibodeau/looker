view: messaging_actions {
  derived_table: {
    indexes: ["account_id", "action_date"]
    sql_trigger_value: SELECT CURDATE() ;;
    sql:

       select (@row_number:=@row_number + 1) AS id,
       x.account_id as account_id,
       x.signup as signup,
       x.action as action,
       x.action_date as action_date
       FROM
       (SELECT @row_number:=0) AS t, (
       SELECT m.account_id as account_id,
              a.confirmed_at as signup,
       "write_message" as action,
       m.message_date as action_date
FROM ${messages.SQL_TABLE_NAME} m inner join accounts a on a.id = m.account_id
UNION
SELECT p.account_id,
       a.confirmed_at as signup,
       "read_comm" as action,
       p.last_read_at as action_date
FROM participants p inner join accounts a on a.id = p.account_id
UNION
SELECT c.account_id,
       a.confirmed_at as signup,
       "read_chat" as action,
       mc.read_at as action_date
FROM mess__converser_messages mc
INNER JOIN mess__conversers c on c.id = mc.converser_id
INNER JOIN accounts a on a.id = c.account_id) as x
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

  dimension_group: signup {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.signup ;;
  }

  dimension_group: action_date {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.action_date ;;
  }

  set: detail {
    fields: [account_id, action, action_date_date]
  }
}
