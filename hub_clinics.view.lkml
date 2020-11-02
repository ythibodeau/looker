explore: hub_clinics {}
view: hub_clinics {
  derived_table: {
    sql_trigger_value: SELECT CURDATE() ;;
    sql: select g.acronym,
       g.name,
       i.short_name,
       l.text,
       l.locality,
       EXISTS(SELECT group_id FROM pati__providers where group_id = g.id) as has_emr_connected,
       EXISTS(SELECT group_id FROM memberships     where group_id = g.id) as has_members_created,
       EXISTS(SELECT group_id FROM pati__offerings where group_id = g.id) as has_services,
       EXISTS(SELECT hubwt.offering_id FROM b_hub__web_templates hubwt INNER JOIN pati__offerings o on o.id = hubwt.offering_id INNER JOIN `groups` g on g.id = o.group_id) as has_services_configured
from `groups` g
left join  health_institutions i on i.id = g.health_institution_id
left join  locations l           on l.id = g.location_id
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

  dimension: acronym {
    type: string
    sql: ${TABLE}.acronym ;;
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
