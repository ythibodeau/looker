- dashboard: petal_patient__usage
  title: Petal Patient - Usage
  layout: newspaper
  elements:
  - name: Petal Patient - Total Patients
    title: Petal Patient - Total Patients
    model: test_yves
    explore: pati__patients
    type: single_value
    fields:
    - pati__patients.count
    limit: 500
    total: true
    dynamic_fields:
    - table_calculation: total
      label: Total
      expression: running_total(${pati__patients.count})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: ''
    series_types: {}
    hidden_fields:
    - pati__patients.count
    row: 0
    col: 0
    width: 5
    height: 4
  - name: Petal Patient - Total Appointments
    title: Petal Patient - Total Appointments
    model: test_yves
    explore: pati__appointments
    type: single_value
    fields:
    - pati__appointments.patient_count
    limit: 500
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_labels:
      pati__appointments.patient_count: Appointments
    series_types: {}
    row: 0
    col: 15
    width: 4
    height: 4
  - name: Petal Patient - Total Reminders
    title: Petal Patient - Total Reminders
    model: test_yves
    explore: appointment_reminders
    type: single_value
    fields:
    - appointment_reminders.count
    limit: 500
    query_timezone: America/New_York
    series_types: {}
    row: 0
    col: 19
    width: 5
    height: 4
  - name: Petal Patient - Total Patients Confirmed
    title: Petal Patient - Total Patients Confirmed
    model: test_yves
    explore: pati__patients
    type: single_value
    fields:
    - pati__patients.count_confirmed
    limit: 500
    total: true
    dynamic_fields:
    - table_calculation: total
      label: Total
      expression: running_total(${pati__patients.count})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: ''
    series_types: {}
    hidden_fields: []
    row: 0
    col: 5
    width: 5
    height: 4
  - name: Petal Patient - Confirmed Patients / Week
    title: Petal Patient - Confirmed Patients / Week
    model: test_yves
    explore: pati__patients
    type: looker_area
    fields:
    - pati__patients.accepted_week
    - pati__patients.count_confirmed
    fill_fields:
    - pati__patients.accepted_week
    filters:
      pati__patients.accepted_week: 6 months
    sorts:
    - pati__patients.accepted_week desc
    limit: 500
    total: true
    query_timezone: America/New_York
    stacking: ''
    colors:
    - "#62bad4"
    - "#a9c574"
    - "#929292"
    - "#9fdee0"
    - "#1f3e5a"
    - "#90c8ae"
    - "#92818d"
    - "#c5c6a6"
    - "#82c2ca"
    - "#cee0a0"
    - "#928fb4"
    - "#9fc190"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    comparison_label: ''
    hidden_fields: []
    row: 4
    col: 0
    width: 24
    height: 6
  - name: Petal Patient - Appointments / Day
    title: Petal Patient - Appointments / Day
    model: test_yves
    explore: pati__appointments
    type: looker_column
    fields:
    - pati__appointments.patient_regular_count
    - pati__appointments.patient_walk_in_count
    - pati__appointments.created_date
    fill_fields:
    - pati__appointments.created_date
    filters:
      pati__appointments.created_date: 30 days
    sorts:
    - pati__appointments.created_date desc
    limit: 500
    query_timezone: America/New_York
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_labels:
      pati__appointments.patient_regular_count: Regular
      pati__appointments.patient_walk_in_count: Walk-in
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Appointment creation date
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 10
    col: 0
    width: 12
    height: 8
  - name: Petal Patient - Reminders / Day
    title: Petal Patient - Reminders / Day
    model: test_yves
    explore: appointment_reminders
    type: looker_column
    fields:
    - appointment_reminders.count
    - appointment_reminders.sent_date_date
    - appointment_reminders.method
    pivots:
    - appointment_reminders.method
    fill_fields:
    - appointment_reminders.sent_date_date
    filters:
      appointment_reminders.sent_date_date: 30 days
      appointment_reminders.method: not 4
    sorts:
    - appointment_reminders.sent_date_date desc
    - appointment_reminders.method
    limit: 500
    query_timezone: America/New_York
    stacking: normal
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_labels:
      1 - appointment_reminders.count: Email
      2 - appointment_reminders.count: Phone
      3 - appointment_reminders.count: SMS
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 10
    col: 12
    width: 12
    height: 8
  - name: Petal Patient - Appointments / EMR
    title: Petal Patient - Appointments / EMR
    model: test_yves
    explore: pati__appointments
    type: looker_pie
    fields:
    - pati__appointments.patient_count
    - clinics.adapterable_type
    filters:
      pati__appointments.created_date: 30 days
    sorts:
    - pati__appointments.patient_count desc
    limit: 500
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_labels:
      pati__appointments.patient_count: Appointments
    series_types: {}
    row: 18
    col: 0
    width: 12
    height: 8
  - name: Petal Patient - Activation Rate
    title: Petal Patient - Activation Rate
    model: test_yves
    explore: pati__patients
    type: single_value
    fields:
    - pati__patients.count
    - pati__patients.count_confirmed
    limit: 500
    dynamic_fields:
    - table_calculation: activation_rate
      label: Activation Rate
      expression: "${pati__patients.count_confirmed}/${pati__patients.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    hidden_fields:
    - pati__patients.count_confirmed
    - pati__patients.count
    series_types: {}
    row: 0
    col: 10
    width: 5
    height: 4
