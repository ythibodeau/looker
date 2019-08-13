view: appointment_reminders {
  label: "Appointment Reminders"
  derived_table: {
    explore_source: noti__notifications {
      column: context_id {}
      column: context_type {}
      column: created_by_id {}
      column: created_by_type {}
      column: created_date {}
      column: failure_reason {}
      column: id {}
      column: kind {}
      column: method {}
      column: sent_date {}
      column: status {}
      column: subkind {}
      column: target_id {}
      column: target_type {}
      column: updated_date {}
      filters: {
        field: noti__notifications.target_type
        value: "Patient::Patient"
      }
      filters: {
        field: noti__notifications.kind
        value: "3"
      }
      filters: {
        field: noti__notifications.status
        value: "1 OR 2"
      }
    }
  }
  dimension: context_id {
    type: number
  }
  dimension: context_type {}
  dimension: created_by_id {
    type: number
  }
  dimension: created_by_type {}
  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }
  dimension: created_month_only {
    type: number
    sql: MONTH(${TABLE}.created_date});;
  }
  dimension: failure_reason {}
  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  dimension: kind {
    type: number
  }
  dimension: method {
    type: number
  }
  dimension_group: sent_date {
    type: time
    timeframes: [
      date,
      month,
      week,
      day_of_week
    ]
  }
  dimension: status {
    type: number
  }
  dimension: subkind {}
  dimension: target_id {
    type: number
  }
  dimension: target_type {}
  dimension: updated_date {
    type: date
  }

  measure: count {
    type: count
    drill_fields: [id]
  }

  measure: email_count {
    type: count
    filters: {
      field: method
      value: "1"
    }
  }

  measure: phone_count {
    type: count
    filters: {
      field: method
      value: "2"
    }
  }

  measure: sms_count {
    type: count
    filters: {
      field: method
      value: "3"
    }
  }

  measure: number_of_unique_appointments {
    type: count_distinct
    sql: ${context_id} ;;
  }
}
