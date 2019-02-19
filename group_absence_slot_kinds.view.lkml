view: group_absence_slot_kinds {
  sql_table_name: petalmd.group_absence_slot_kinds ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: absence_slot_kind_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.absence_slot_kind_id ;;
  }

  dimension: display_sequence {
    type: number
    sql: ${TABLE}.display_sequence ;;
  }

  dimension: group_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.group_id ;;
  }

  measure: count {
    type: count
    drill_fields: [id, groups.name, groups.parent_group_id, absence_slot_kinds.id]
  }
}