view: specialties {
  sql_table_name: petalmd.specialties ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
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

  dimension: description_en {
    type: string
    sql: ${TABLE}.description_en ;;
  }

  dimension: description_fr_ca {
    type: string
    sql: ${TABLE}.description_fr_ca ;;
  }

  dimension: description {
    label: "specialty.description"
    type: string
    sql:
    CASE
      WHEN ${TABLE}.code = "allergy_immunology" THEN "{{_localization['allergy_immunology']}}"
      WHEN ${TABLE}.code = "anesthesiology" THEN "{{_localization['anesthesiology']}}"
      WHEN ${TABLE}.code = "biochemistry" THEN "{{_localization['biochemistry']}}"
      WHEN ${TABLE}.code = "cardiac_surgery" THEN "{{_localization['cardiac_surgery']}}"
      WHEN ${TABLE}.code = "cardiology" THEN "{{_localization['cardiology']}}"
      WHEN ${TABLE}.code = "community_health" THEN "{{_localization['community_health']}}"
      WHEN ${TABLE}.code = "dermatology" THEN "{{_localization['dermatology']}}"
      WHEN ${TABLE}.code = "emergency_medicine" THEN "{{_localization['emergency_medicine']}}"
      WHEN ${TABLE}.code = "endocrinology_metabolism" THEN "{{_localization['endocrinology_metabolism']}}"
      WHEN ${TABLE}.code = "family_practice" THEN "{{_localization['family_practice']}}"
      WHEN ${TABLE}.code = "gastroenterology" THEN "{{_localization['gastroenterology']}}"
      WHEN ${TABLE}.code = "general_surgery" THEN "{{_localization['general_surgery']}}"
      WHEN ${TABLE}.code = "genetics" THEN "{{_localization['genetics']}}"
      WHEN ${TABLE}.code = "geriatrics" THEN "{{_localization['geriatrics']}}"
      WHEN ${TABLE}.code = "hematology" THEN "{{_localization['hematology']}}"
      WHEN ${TABLE}.code = "internal_medicine" THEN "{{_localization['internal_medicine']}}"
      WHEN ${TABLE}.code = "microbiology_infectious_diseases" THEN "{{_localization['microbiology_infectious_diseases']}}"
      WHEN ${TABLE}.code = "nephrology" THEN "{{_localization['nephrology']}}"
      WHEN ${TABLE}.code = "neurology" THEN "{{_localization['neurology']}}"
      WHEN ${TABLE}.code = "neurosurgery" THEN "{{_localization['neurosurgery']}}"
      WHEN ${TABLE}.code = "nuclear_medicine" THEN "{{_localization['nuclear_medicine']}}"
      WHEN ${TABLE}.code = "obstetrics_gynecology" THEN "{{_localization['obstetrics_gynecology']}}"
      WHEN ${TABLE}.code = "oncology" THEN "{{_localization['oncology']}}"
      WHEN ${TABLE}.code = "ophthalmology" THEN "{{_localization['ophthalmology']}}"
      WHEN ${TABLE}.code = "orthopedics" THEN "{{_localization['orthopedics']}}"
      WHEN ${TABLE}.code = "otorhinolaryngology" THEN "{{_localization['otorhinolaryngology']}}"
      WHEN ${TABLE}.code = "general_pathology" THEN "{{_localization['general_pathology']}}"
      WHEN ${TABLE}.code = "pediatrics" THEN "{{_localization['pediatrics']}}"
      WHEN ${TABLE}.code = "physiatry" THEN "{{_localization['physiatry']}}"
      WHEN ${TABLE}.code = "plastic_surgery" THEN "{{_localization['plastic_surgery']}}"
      WHEN ${TABLE}.code = "pneumology" THEN "{{_localization['pneumology']}}"
      WHEN ${TABLE}.code = "psychiatry" THEN "{{_localization['psychiatry']}}"
      WHEN ${TABLE}.code = "radiation_oncology" THEN "{{_localization['radiation_oncology']}}"
      WHEN ${TABLE}.code = "radiology" THEN "{{_localization['radiology']}}"
      WHEN ${TABLE}.code = "rheumatology" THEN "{{_localization['rheumatology']}}"
      WHEN ${TABLE}.code = "urology" THEN "{{_localization['urology']}}"
      WHEN ${TABLE}.code = "colorectal_surgery" THEN "{{_localization['colorectal_surgery']}}"
      WHEN ${TABLE}.code = "oncology_surgery" THEN "{{_localization['oncology_surgery']}}"
      WHEN ${TABLE}.code = "pediatric_surgery" THEN "{{_localization['pediatric_surgery']}}"
      WHEN ${TABLE}.code = "thoracic_surgery" THEN "{{_localization['thoracic_surgery']}}"
      WHEN ${TABLE}.code = "vascular_surgery" THEN "{{_localization['vascular_surgery']}}"
      WHEN ${TABLE}.code = "dentistry" THEN "{{_localization['dentistry']}}"
      WHEN ${TABLE}.code = "pediatric_hematology_oncology" THEN "{{_localization['pediatric_hematology_oncology']}}"
      WHEN ${TABLE}.code = "pediatric_emergency_medicine" THEN "{{_localization['pediatric_emergency_medicine']}}"
      WHEN ${TABLE}.code = "adolescent_medicine" THEN "{{_localization['adolescent_medicine']}}"
      WHEN ${TABLE}.code = "critical_care_medicine" THEN "{{_localization['critical_care_medicine']}}"
      WHEN ${TABLE}.code = "occupational_medicine" THEN "{{_localization['occupational_medicine']}}"
      WHEN ${TABLE}.code = "maternal_fetal_medicine" THEN "{{_localization['maternal_fetal_medicine']}}"
      WHEN ${TABLE}.code = "neonatal_perinatal_medicine" THEN "{{_localization['neonatal_perinatal_medicine']}}"
      WHEN ${TABLE}.code = "neuropathology" THEN "{{_localization['neuropathology']}}"
      WHEN ${TABLE}.code = "gynecologic_oncology" THEN "{{_localization['gynecologic_oncology']}}"
      WHEN ${TABLE}.code = "pharmacy" THEN "{{_localization['pharmacy']}}"
      WHEN ${TABLE}.code = "oral_and_maxillofacial_surgery" THEN "{{_localization['oral_and_maxillofacial_surgery']}}"
      WHEN ${TABLE}.code = "anathomopathology" THEN "{{_localization['anathomopathology']}}"
      WHEN ${TABLE}.code = "clinician_scholar" THEN "{{_localization['clinician_scholar']}}"
      WHEN ${TABLE}.code = "clinician_investigator" THEN "{{_localization['clinician_investigator']}}"
      WHEN ${TABLE}.code = "endocrinology" THEN "{{_localization['endocrinology']}}"
      WHEN ${TABLE}.code = "public_health" THEN "{{_localization['public_health']}}"
      WHEN ${TABLE}.code = "care_of_the_elderly" THEN "{{_localization['care_of_the_elderly']}}"
      WHEN ${TABLE}.code = "electroencephalography" THEN "{{_localization['electroencephalography']}}"
      WHEN ${TABLE}.code = "child_adolescent_psychiatry" THEN "{{_localization['child_adolescent_psychiatry']}}"
      WHEN ${TABLE}.code = "clinical_pharmacology_toxicology" THEN "{{_localization['clinical_pharmacology_toxicology']}}"
      WHEN ${TABLE}.code = "developmental_pediatrics" THEN "{{_localization['developmental_pediatrics']}}"
      WHEN ${TABLE}.code = "forensic_pathology" THEN "{{_localization['forensic_pathology']}}"
      WHEN ${TABLE}.code = "forensic_psychiatry" THEN "{{_localization['forensic_psychiatry']}}"
      WHEN ${TABLE}.code = "geriatric_psychiatry" THEN "{{_localization['geriatric_psychiatry']}}"
      WHEN ${TABLE}.code = "gynecologic_reproductive_endocrinology_infertility" THEN "{{_localization['gynecologic_reproductive_endocrinology_infertility']}}"
      WHEN ${TABLE}.code = "infectious_diseases" THEN "{{_localization['infectious_diseases']}}"
      WHEN ${TABLE}.code = "interventional_radiology" THEN "{{_localization['interventional_radiology']}}"
      WHEN ${TABLE}.code = "palliative_medicine" THEN "{{_localization['palliative_medicine']}}"
      WHEN ${TABLE}.code = "pediatric_radiology" THEN "{{_localization['pediatric_radiology']}}"
      WHEN ${TABLE}.code = "acupuncture" THEN "{{_localization['acupuncture']}}"
      WHEN ${TABLE}.code = "audiology" THEN "{{_localization['audiology']}}"
      WHEN ${TABLE}.code = "cardiology_technologist" THEN "{{_localization['cardiology_technologist']}}"
      WHEN ${TABLE}.code = "podiatrist" THEN "{{_localization['podiatrist']}}"
      WHEN ${TABLE}.code = "chiropractor" THEN "{{_localization['chiropractor']}}"
      WHEN ${TABLE}.code = "counselling_therapist" THEN "{{_localization['counselling_therapist']}}"
      WHEN ${TABLE}.code = "denturist" THEN "{{_localization['denturist']}}"
      WHEN ${TABLE}.code = "dietitian_nutritionist" THEN "{{_localization['dietitian_nutritionist']}}"
      WHEN ${TABLE}.code = "paramedic" THEN "{{_localization['paramedic']}}"
      WHEN ${TABLE}.code = "hearing_instrument_dispensing" THEN "{{_localization['hearing_instrument_dispensing']}}"
      WHEN ${TABLE}.code = "kinesiology" THEN "{{_localization['kinesiology']}}"
      WHEN ${TABLE}.code = "massage_therapist" THEN "{{_localization['massage_therapist']}}"
      WHEN ${TABLE}.code = "medical_diagnostic_therapeutic_technologist" THEN "{{_localization['medical_diagnostic_therapeutic_technologist']}}"
      WHEN ${TABLE}.code = "medical_radiation_technologist" THEN "{{_localization['medical_radiation_technologist']}}"
      WHEN ${TABLE}.code = "midwife" THEN "{{_localization['midwife']}}"
      WHEN ${TABLE}.code = "naturopathic_medicine" THEN "{{_localization['naturopathic_medicine']}}"
      WHEN ${TABLE}.code = "nursing_licensed_practical" THEN "{{_localization['nursing_licensed_practical']}}"
      WHEN ${TABLE}.code = "nursing_registered" THEN "{{_localization['nursing_registered']}}"
      WHEN ${TABLE}.code = "nursing_registered_psychiatric" THEN "{{_localization['nursing_registered_psychiatric']}}"
      WHEN ${TABLE}.code = "nursing_specialized_nurse_practitioner" THEN "{{_localization['nursing_specialized_nurse_practitioner']}}"
      WHEN ${TABLE}.code = "occupational_therapist" THEN "{{_localization['occupational_therapist']}}"
      WHEN ${TABLE}.code = "orthotics_prosthetics" THEN "{{_localization['orthotics_prosthetics']}}"
      WHEN ${TABLE}.code = "orthotherapist" THEN "{{_localization['orthotherapist']}}"
      WHEN ${TABLE}.code = "physiotherapist" THEN "{{_localization['physiotherapist']}}"
      WHEN ${TABLE}.code = "psychologist" THEN "{{_localization['psychologist']}}"
      WHEN ${TABLE}.code = "respiratory_therapist" THEN "{{_localization['respiratory_therapist']}}"
      WHEN ${TABLE}.code = "social_worker" THEN "{{_localization['social_worker']}}"
      WHEN ${TABLE}.code = "speech_language_pathologist" THEN "{{_localization['speech_language_pathologist']}}"
      WHEN ${TABLE}.code = "traditional_chinese_medicine" THEN "{{_localization['traditional_chinese_medicine']}}"
      WHEN ${TABLE}.code = "undefined" THEN "{{_localization['undefined']}}"
      WHEN ${TABLE}.code = "clinical_assistant" THEN "{{_localization['clinical_assistant']}}"
      WHEN ${TABLE}.code = "Infirmière_Clinicienne" THEN "{{_localization['Infirmière_Clinicienne']}}"
      WHEN ${TABLE}.code = "hematology_oncology" THEN "{{_localization['hematology_oncology']}}"
      WHEN ${TABLE}.code = "Pediatric_Dentistry" THEN "{{_localization['Pediatric_Dentistry']}}"
      WHEN ${TABLE}.code = "Endodontics" THEN "{{_localization['Endodontics']}}"
      WHEN ${TABLE}.code = "Oral_medicine" THEN "{{_localization['Oral_medicine']}}"
      WHEN ${TABLE}.code = "Oral_and_maxillofacial_pathology" THEN "{{_localization['Oral_and_maxillofacial_pathology']}}"
      WHEN ${TABLE}.code = "Oral_and_maxillofacial_radiology" THEN "{{_localization['Oral_and_maxillofacial_radiology']}}"
      WHEN ${TABLE}.code = "Orthodontics" THEN "{{_localization['Orthodontics']}}"
      WHEN ${TABLE}.code = "Periodontics" THEN "{{_localization['Periodontics']}}"
      WHEN ${TABLE}.code = "Prosthodontics" THEN "{{_localization['Prosthodontics']}}"
      WHEN ${TABLE}.code = "abdominal_surgery" THEN "{{_localization['abdominal_surgery']}}"
      WHEN ${TABLE}.code = "obstetric" THEN "{{_localization['obstetric']}}"
      WHEN ${TABLE}.code = "gynaecology" THEN "{{_localization['gynaecology']}}"
      WHEN ${TABLE}.code = "gastro_hepa_pedia" THEN "{{_localization['gastro_hepa_pedia']}}"
      WHEN ${TABLE}.code = "pedia_cardiology" THEN "{{_localization['pedia_cardiology']}}"
      WHEN ${TABLE}.code = "pedia_neuro" THEN "{{_localization['pedia_neuro']}}"
      WHEN ${TABLE}.code = "pedia_endo" THEN "{{_localization['pedia_endo']}}"
      WHEN ${TABLE}.code = "technologue" THEN "{{_localization['technologue']}}"
      WHEN ${TABLE}.code = "perfusionniste" THEN "{{_localization['perfusionniste']}}"
      WHEN ${TABLE}.code = "coordinator" THEN "{{_localization['coordinator']}}"
      WHEN ${TABLE}.code = "technician" THEN "{{_localization['technician']}}"
      WHEN ${TABLE}.code = "intern" THEN "{{_localization['intern']}}"
      WHEN ${TABLE}.code = "laboratory_assistant" THEN "{{_localization['laboratory_assistant']}}"
      WHEN ${TABLE}.code = "orderly" THEN "{{_localization['orderly']}}"
      WHEN ${TABLE}.code = "hemato_patho" THEN "{{_localization['hemato_patho']}}"
      WHEN ${TABLE}.code = "hospital_medicine" THEN "{{_localization['hospital_medicine']}}"
      WHEN ${TABLE}.code = "dental_public_health" THEN "{{_localization['dental_public_health']}}"
      ELSE "{{_localization['no_specialty']}}"
    END
    ;;
  }

  dimension: hubspot_id {
    type: string
    sql: ${TABLE}.hubspot_id ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
