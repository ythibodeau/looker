view: hlth_messaging_actions {
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
       CASE WHEN m.message_type = "COMM" THEN "write_comm"
            WHEN m.message_type = "CHAT" THEN "write_chat"
        END as action,
       -- "write_message" as action,
      CONVERT_TZ(m.message_date,'UTC','America/New_York') as action_date
FROM ${messages.SQL_TABLE_NAME} m
       inner join accounts a on a.id = m.account_id WHERE YEAR(CONVERT_TZ(m.message_date ,'UTC','America/New_York')) >= 2019
UNION
SELECT p.account_id,
       a.confirmed_at as signup,
       "read_comm" as action,
      CONVERT_TZ(p.last_read_at,'UTC','America/New_York') as action_date
FROM participants p inner join accounts a on a.id = p.account_id WHERE YEAR(CONVERT_TZ(last_read_at ,'UTC','America/New_York')) >= 2019
UNION
SELECT c.account_id,
       a.confirmed_at as signup,
       "read_chat" as action,
      CONVERT_TZ(mc.read_at,'UTC','America/New_York') as action_date
FROM mess__converser_messages mc
INNER JOIN mess__conversers c on c.id = mc.converser_id
INNER JOIN accounts a on a.id = c.account_id
WHERE YEAR(CONVERT_TZ(mc.read_at,'UTC','America/New_York')) >= 2019) as x

 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: count_distinct_account_id {
    type: count_distinct
    sql: ${TABLE}.account_id ;;
    drill_fields: [accounts.id, accounts.full_name]
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
    convert_tz: no
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
    convert_tz: no
  }

  set: detail {
    fields: [account_id, action, action_date_date]
  }
}
