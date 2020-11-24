view: hub_clinics {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql:
           -- Web 1
           WITH
           web1 AS
           (SELECT g.id as group_id, hubwt.offering_id FROM b_hub__web_templates hubwt
           INNER JOIN pati__offerings o on o.id = hubwt.offering_id
           INNER JOIN `groups` g on g.id = o.group_id),
           web2 as
           (SELECT g.id as group_id, hubwt.account_task_id FROM b_hub__web_templates hubwt
           INNER JOIN pati__account_tasks ata on ata.id = hubwt.account_task_id
           INNER JOIN pati__tasks t on t.id = ata.task_id
           INNER JOIN pati__reasons r on r.id = t.reason_id
           INNER JOIN pati__offerings o on o.id = r.offering_id
           INNER JOIN `groups` g on g.id = o.group_id)
           SELECT
       g.id,
       g.acronym,
       g.name,
       i.short_name,
       SUBSTRING_INDEX(p.adapterable_type,"::", -1) as emr,
       l.text,
       l.id as location_id,
       l.locality,
       g.health_institution_id as institution_id,
       EXISTS(SELECT group_id FROM pati__providers where group_id = g.id) as has_emr_connected,
       EXISTS(SELECT group_id FROM memberships     where group_id = g.id) as has_members_created,
       EXISTS(SELECT group_id FROM pati__offerings where group_id = g.id) as has_services,
       EXISTS(SELECT group_id FROM web1 WHERE web1.group_id = g.id) OR
       EXISTS(SELECT group_id FROM web2 WHERE web2.group_id = g.id)

          as has_services_configured
from `groups` g
left join  health_institutions i on i.id = g.health_institution_id
left join  locations l           on l.id = g.location_id
left join pati__providers p on g.id = p.group_id
inner join group_kinds gk        on gk.id = g.kind_id
where
    gk.id = 6
and g.inactive = 0
and g.implementation = 1
AND g.booking_hub_managed = 1

 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    primary_key: yes
    sql: ${TABLE}.id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: acronym {
    type: string
    sql: ${TABLE}.acronym ;;
  }

  dimension: emr {
    type: string
    sql: ${TABLE}.emr ;;
  }


  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: short_name {
    type: string
    sql: ${TABLE}.short_name ;;
  }

  dimension: text {
    type: string
    sql: ${TABLE}.text ;;
  }

  dimension: locality {
    type: string
    sql: ${TABLE}.locality ;;
  }

  dimension: institution_id {
    type: number
    sql: ${TABLE}.institution_id ;;
  }

  dimension: has_emr_connected {
    type: yesno
    sql: ${TABLE}.has_emr_connected = 1 ;;
    html:
    {% if rendered_value == 'Yes' %}
      <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
      <p style="color: black; background-color: #ff6961; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  dimension: has_members_created {
    type: yesno
    sql: ${TABLE}.has_members_created = 1 ;;
    html:
    {% if rendered_value == 'Yes' %}
    <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; background-color: #ff6961; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  dimension: has_services {
    type: yesno
    sql: ${TABLE}.has_services = 1 ;;
    html:
    {% if rendered_value == 'Yes' %}
    <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; background-color: #ff6961; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  dimension: has_services_configured {
    type: yesno
    sql: ${TABLE}.has_services_configured = 1 ;;
    html:
    {% if rendered_value == 'Yes' %}
    <p style="color: black; background-color: lightgreen; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
    <p style="color: black; background-color: #ff6961; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %} ;;
  }

  dimension: is_hub_ready {
    type: yesno
    sql: "Yes" ;;
  }

  set: detail {
    fields: [
      acronym,
      name,
      short_name,
      text,
      locality,
      has_emr_connected,
      has_members_created,
      has_services,
      has_services_configured
    ]
  }
}
