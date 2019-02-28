- dashboard: implementation_dashboard
  title: Implementation Dashboard
  layout: newspaper
  elements:
  - name: Tasks Kinds
    title: Tasks Kinds
    model: test_yves
    explore: implementation_monitoring
    type: looker_pie
    fields:
    - implementation_monitoring.count
    - implementation_monitoring.has_task_kinds
    fill_fields:
    - implementation_monitoring.has_task_kinds
    sorts:
    - implementation_monitoring.count desc
    limit: 500
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      'No': "#929292"
      'Yes': "#928fb4"
    series_types: {}
    hidden_fields: []
    row: 0
    col: 0
    width: 6
    height: 5
  - name: Tasks
    title: Tasks
    model: test_yves
    explore: implementation_monitoring
    type: looker_pie
    fields:
    - implementation_monitoring.count
    - implementation_monitoring.has_tasks
    fill_fields:
    - implementation_monitoring.has_tasks
    sorts:
    - implementation_monitoring.count desc
    limit: 500
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      'No': "#929292"
    series_types: {}
    hidden_fields: []
    row: 0
    col: 6
    width: 6
    height: 5
  - name: Holidays
    title: Holidays
    model: test_yves
    explore: implementation_monitoring
    type: looker_pie
    fields:
    - implementation_monitoring.has_holidays
    - implementation_monitoring.count
    fill_fields:
    - implementation_monitoring.has_holidays
    sorts:
    - implementation_monitoring.has_holidays
    limit: 500
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      'No': "#929292"
    series_types: {}
    hidden_fields: []
    row: 0
    col: 18
    width: 6
    height: 5
  - name: Assignments
    title: Assignments
    model: test_yves
    explore: implementation_monitoring
    type: looker_pie
    fields:
    - implementation_monitoring.count
    - implementation_monitoring.has_assignments
    fill_fields:
    - implementation_monitoring.has_assignments
    sorts:
    - implementation_monitoring.count desc
    limit: 500
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    series_colors:
      'No': "#929292"
      'Yes': "#1f3e5a"
    series_types: {}
    hidden_fields: []
    row: 0
    col: 12
    width: 6
    height: 5
  - name: Scheduling  - Implementation List
    title: Scheduling  - Implementation List
    model: test_yves
    explore: implementation_monitoring
    type: table
    fields:
    - implementation_monitoring.id
    - implementation_monitoring.acronym
    - implementation_monitoring.name
    - implementation_monitoring.created_at
    - implementation_monitoring.membership_count
    - implementation_monitoring.task_kind_count
    - implementation_monitoring.task_count
    - implementation_monitoring.activated_count
    - implementation_monitoring.assignment_count
    - implementation_monitoring.holidays_count
    filters:
      implementation_monitoring.excluded: 'No'
    sorts:
    - implementation_monitoring.id
    limit: 500
    dynamic_fields:
    - table_calculation: activation
      label: Activation %
      expression: "${implementation_monitoring.activated_count}/${implementation_monitoring.membership_count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: dimension
      _type_hint: number
    - table_calculation: assignment_ratio
      label: Assignment Ratio
      expression: "${implementation_monitoring.assignment_count}/${implementation_monitoring.task_count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: dimension
      _type_hint: number
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      implementation_monitoring.id: ID
      implementation_monitoring.name: Name
      implementation_monitoring.acronym: Acronym
      implementation_monitoring.membership_count: Memberships
      implementation_monitoring.holidays_count: Holidays
      implementation_monitoring.task_count: Tasks
      implementation_monitoring.assignment_count: Assignments
      implementation_monitoring.task_kind_count: Task Kinds
      implementation_monitoring.created_at: Creation Date
    table_theme: editable
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
      - activation
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
      - implementation_monitoring.holidays_count
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
      - implementation_monitoring.task_count
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
      - implementation_monitoring.assignment_count
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
      - implementation_monitoring.task_kind_count
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
      - assignment_ratio
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - implementation_monitoring.activated_count
    row: 5
    col: 0
    width: 24
    height: 30
