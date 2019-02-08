- dashboard: petal_patient__heat_map
  title: Petal Patient - Heat Map
  layout: newspaper
  elements:
  - name: Petal Patient - Appointments Heat Map
    title: Petal Patient - Appointments Heat Map
    model: test_yves
    explore: pati__appointments
    type: table
    fields:
    - clinics.name
    - clinics.adapterable_type
    - pati__appointments.patient_regular_count
    - pati__appointments.patient_walk_in_count
    - pati__appointments.created_week
    pivots:
    - pati__appointments.created_week
    fill_fields:
    - pati__appointments.created_week
    filters:
      pati__appointments.created_date: 6 months
    sorts:
    - pati__appointments.patient_regular_count desc 0
    - pati__appointments.created_week
    limit: 500
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      clinics.name: Clinic
      clinics.adapterable_type: EMR
      pati__appointments.patient_regular_count: Regular
      pati__appointments.patient_walk_in_count: Walk-In
      pati__appointments.created_week: Week
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - pati__appointments.patient_regular_count
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - pati__appointments.patient_walk_in_count
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    row: 0
    col: 0
    width: 24
    height: 10
  - name: Petal Patient - Reminders Heat Map
    title: Petal Patient - Reminders Heat Map
    model: test_yves
    explore: appointment_reminders
    type: table
    fields:
    - clinics.name
    - clinics.adapterable_type
    - appointment_reminders.sent_date_week
    - appointment_reminders.count
    pivots:
    - appointment_reminders.sent_date_week
    fill_fields:
    - appointment_reminders.sent_date_week
    filters:
      appointment_reminders.sent_date_date: 6 months
    sorts:
    - appointment_reminders.sent_date_week
    - appointment_reminders.count desc 0
    limit: 500
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      clinics.name: Clinic
      clinics.adapterable_type: EMR
      appointment_reminders.number_of_unique_appointments: Reminders
      appointment_reminders.sent_date_week: Sent Date
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Red to Yellow to Green
        colors:
        - "#F36254"
        - "#FCF758"
        - "#4FBC89"
      bold: false
      italic: false
      strikethrough: false
      fields:
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 10
    col: 0
    width: 24
    height: 11
