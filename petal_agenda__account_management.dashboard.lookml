- dashboard: petal_agenda__account_management
  title: Petal Agenda - Account Management
  layout: newspaper
  elements:
  - name: Account Management - Periods List
    title: Account Management - Periods List
    model: test_yves
    explore: sche__periods
    type: table
    fields:
    - sche__periods.name
    - sche__periods.published_date
    - sche__periods.start_date
    - sche__periods.end_date
    - sche__change_requests.count
    - sche__change_requests.initiated_by_md_count
    - sche__period_histories.script_assignments_count
    - sche__period_histories.all_assignments_count
    filters:
      groups.name: ''
    sorts:
    - sche__periods.start_date desc
    limit: 500
    dynamic_fields:
    - table_calculation: initiated_by_md
      label: "% Initiated by MD"
      expression: "${sche__change_requests.initiated_by_md_count} / ${sche__change_requests.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    filter_expression: "${sche__change_requests.executed_date} >= ${sche__periods.start_date}\
      \ AND ${sche__change_requests.executed_date} <= ${sche__periods.end_date}\n"
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
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
      - initiated_by_md
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    row: 0
    col: 0
    width: 8
    height: 6
  - name: Account Management - Manual Assignments
    title: Account Management - Manual Assignments
    model: test_yves
    explore: sche__periods
    type: looker_column
    fields:
    - sche__periods.name
    - sche__periods.start_date
    - sche__periods.end_date
    - sche__periods.published_date
    - sche__periods.id
    - sche__period_histories.is_manual_count
    - sche__assignments.count
    filters:
      groups.name: '"Service de Radiologie du CISSS de  l''Outaouais"'
      sche__periods.published_date: after 2017/01/01
    sorts:
    - sche__periods.published_date
    limit: 500
    dynamic_fields:
    - table_calculation: manual_assignments
      label: "% Manual Assignments"
      expression: "${sche__period_histories.is_manual_count}/${sche__assignments.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    filter_expression: "${sche__period_histories.created_date} < ${sche__periods.published_date}"
    query_timezone: America/New_York
    stacking: ''
    colors:
    - "#294987"
    - "#5a1038"
    - "#ff947c"
    - "#1f6b62"
    - "#764173"
    - "#910303"
    - "#b2947c"
    - "#192d54"
    - "#a31e67"
    - "#a16154"
    - "#0f544b"
    - "#ffd9ba"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      manual_assignments: "#3a6cc9"
    series_types: {}
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: manual_assignments
        name: "% Manual Assignments"
        axisId: manual_assignments
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: custom
      tickDensityCustom: '3'
      type: linear
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
    reference_lines:
    - reference_type: range
      line_value: mean
      range_end: '1'
      margin_top: deviation
      margin_bottom: variance
      label_position: center
      color: "#ff4231"
      range_start: '0.25'
      margin_value: 27%
      label: At-Risk
    - reference_type: range
      line_value: mean
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: center
      color: "#f3b248"
      range_start: '0.15'
      range_end: '0.25'
      label: Danger
    - reference_type: range
      line_value: mean
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: center
      color: "#3fce77"
      range_start: '0'
      range_end: '0.15'
      label: OK
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: true
    conditional_formatting:
    - type: high to low
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
      - manual_assignments
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - sche__periods.start_date
    - sche__periods.id
    - sche__assignments.count
    - sche__period_histories.is_manual_count
    - sche__periods.end_date
    row: 0
    col: 8
    width: 8
    height: 6
  - name: Account Management - Petal Message Usage
    title: Account Management - Petal Message Usage
    model: test_yves
    explore: comments
    type: looker_line
    fields:
    - comments.created_date
    - comments.regular_count
    - comments.dau
    fill_fields:
    - comments.created_date
    filters:
      comments.created_date: 30 days
    sorts:
    - comments.created_date desc
    limit: 500
    query_timezone: America/New_York
    stacking: ''
    colors:
    - "#a6cee3"
    - "#1f78b4"
    - "#b2df8a"
    - "#33a02c"
    - "#fb9a99"
    - "#e31a1c"
    - "#fdbf6f"
    - "#ff7f00"
    - "#cab2d6"
    - "#6a3d9a"
    - "#edbc0e"
    - "#b15928"
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      comments.regular_count: "#1f78b4"
      comments.dau: "#ff7f00"
    series_types:
      comments.regular_count: column
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: comments.regular_count
        name: Comments Regular Count
        axisId: comments.regular_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: comments.dau
        name: Comments DAU
        axisId: comments.dau
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: ordinal
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 0
    col: 16
    width: 8
    height: 6
