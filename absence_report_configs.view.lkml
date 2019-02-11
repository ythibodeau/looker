view: absence_report_configs {
  sql_table_name: petalmd.absence_report_configs ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: afternoon_unit {
    type: number
    sql: ${TABLE}.afternoon_unit ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

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

  dimension: day_unit {
    type: number
    sql: ${TABLE}.day_unit ;;
  }

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: evening_unit {
    type: number
    sql: ${TABLE}.evening_unit ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  dimension: morning_unit {
    type: number
    sql: ${TABLE}.morning_unit ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: night_unit {
    type: number
    sql: ${TABLE}.night_unit ;;
  }

  dimension: option_id {
    type: number
    sql: ${TABLE}.option_id ;;
  }

  dimension: raw_cwdays {
    type: string
    sql: ${TABLE}.raw_cwdays ;;
  }

  dimension: restriction_kind_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.restriction_kind_id ;;
  }

  dimension: twenty_four_unit {
    type: number
    sql: ${TABLE}.twenty_four_unit ;;
  }

  dimension: units {
    type: string
    sql: ${TABLE}.units ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updated_at ;;
  }

  dimension: use_in_absence_report {
    type: yesno
    sql: ${TABLE}.use_in_absence_report ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, groups.name, groups.parent_group_id, restriction_kinds.id]
  }
}