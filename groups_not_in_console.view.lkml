view: groups_not_in_console {
  derived_table: {
    sql: select distinct CCG.`content_group_id` from `console_content_groups` CCG INNER JOIN groups G ON G.id = CCG.console_group_id AND G.implementation = 0 AND G.inactive = 0 AND G.code NOT LIKE 'CONSOLE-DEMO%'
      ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: content_group_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.content_group_id ;;
  }

  set: detail {
    fields: [content_group_id]
  }
}
