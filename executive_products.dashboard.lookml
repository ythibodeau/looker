- dashboard: exec_dashboard
  title: Exec Dashboard
  layout: newspaper
  elements:
  - name: Exec - Confirmed MDS - Total
    title: Exec - Confirmed MDS - Total
    model: test_yves
    explore: accounts
    type: single_value
    fields:
    - accounts.confirmed_count
    filters:
      account_kinds.mnemonic: doctor
    limit: 500
    query_timezone: America/New_York
    row: 2
    col: 5
    width: 5
    height: 7
  - name: Exec - Confirmed MDs - Percent
    title: Exec - Confirmed MDs - Percent
    model: test_yves
    explore: accounts
    type: single_value
    fields:
    - accounts.confirmed_count
    - accounts.count
    filters:
      account_kinds.mnemonic: doctor
    limit: 500
    dynamic_fields:
    - table_calculation: confirmed
      label: "% Confirmed"
      expression: "${accounts.confirmed_count}/${accounts.count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    series_types: {}
    hidden_fields:
    - accounts.confirmed_count
    - accounts.count
    row: 2
    col: 0
    width: 5
    height: 7
  - name: Produits
    type: text
    title_text: Produits
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Exec - Confirmed MDs
    title: Exec - Confirmed MDs
    model: test_yves
    explore: accounts
    type: looker_area
    fields:
    - accounts.confirmed_count
    - accounts.confirmed_month
    fill_fields:
    - accounts.confirmed_month
    filters:
      account_kinds.mnemonic: doctor
    sorts:
    - accounts.confirmed_month
    limit: 500
    dynamic_fields:
    - table_calculation: calculation_1
      label: Calculation 1
      expression: running_total(${accounts.confirmed_count})
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      accounts.confirmed_count: "#928fb4"
    series_labels:
      accounts.confirmed_count: Confirmed Monthly
      calculation_1: Total Confirmed
    series_types:
      accounts.confirmed_count: column
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: accounts.confirmed_count
        name: Accounts Confirmed Count
        axisId: accounts.confirmed_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: calculation_1
        name: Calculation 1
        axisId: calculation_1
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
    row: 2
    col: 10
    width: 14
    height: 7
