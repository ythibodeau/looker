view: account_group_counts {
  derived_table: {
    indexes: ["account_id"]
    sql_trigger_value: SELECT CURDATE() ;;
    sql: SELECT A.id as account_id, IFNULL(dept_count, 0) as dept_count, IFNULL(hosp_count, 0) as hosp_count, IFNULL(clin_count, 0) as clinic_count, IFNULL(asso_count, 0) as asso_count FROM accounts A
      LEFT JOIN (
          SELECT account_id, COUNT(M.id) as dept_count  FROM memberships M
          INNER JOIN groups G ON G.id = M.group_id
          INNER JOIN group_kinds GK ON GK.id = G.kind_id
          WHERE GK.mnemonic IN ('department')
          GROUP BY account_id
      ) ACC_DEPT ON ACC_DEPT.account_id = A.id
      LEFT JOIN (
          SELECT account_id, COUNT(M.id) as hosp_count  FROM memberships M
          INNER JOIN groups G ON G.id = M.group_id
          INNER JOIN group_kinds GK ON GK.id = G.kind_id
          WHERE GK.mnemonic IN ('hospital')
          GROUP BY account_id
      ) ACC_HOSP ON ACC_HOSP.account_id = A.id
      LEFT JOIN (
          SELECT account_id, COUNT(M.id) as clin_count  FROM memberships M
          INNER JOIN groups G ON G.id = M.group_id
          INNER JOIN group_kinds GK ON GK.id = G.kind_id
          WHERE GK.mnemonic IN ('clinic')
          GROUP BY account_id
      ) ACC_CLIN ON ACC_CLIN.account_id = A.id
      LEFT JOIN (
          SELECT account_id, COUNT(M.id) as asso_count  FROM memberships M
          INNER JOIN groups G ON G.id = M.group_id
          INNER JOIN group_kinds GK ON GK.id = G.kind_id
          WHERE GK.mnemonic IN ('association')
          GROUP BY account_id
      ) ACC_ASSO ON ACC_ASSO.account_id = A.id
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: account_id {
    primary_key: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: dept_count {
    type: number
    sql: ${TABLE}.dept_count ;;
  }

  dimension: hosp_count {
    type: number
    sql: ${TABLE}.hosp_count ;;
  }

  dimension: clinic_count {
    type: number
    sql: ${TABLE}.clinic_count ;;
  }

  dimension: asso_count {
    type: number
    sql: ${TABLE}.asso_count ;;
  }

  dimension: total_groups {
    type: number
    sql: ${dept_count} + ${hosp_count} + ${clinic_count} + ${asso_count} ;;
  }

  dimension: total_non_asso_groups {
    type: number
    sql: ${dept_count} + ${hosp_count} + ${clinic_count}  ;;
  }

  measure: at_least_one_group_count {
    type: count_distinct
    sql: ${account_id} ;;
    filters: {
      field: total_groups
      value: ">0"
    }
  }

  measure: at_least_one_non_asso_group_count {
    type: count_distinct
    sql: ${account_id} ;;
    filters: {
      field: total_non_asso_groups
      value: ">0"
    }
  }

  set: detail {
    fields: [account_id, dept_count, hosp_count, clinic_count, asso_count]
  }
}
