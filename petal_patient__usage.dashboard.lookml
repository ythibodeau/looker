- dashboard: petal_message__usage
  title: Petal Message - Usage
  layout: newspaper
  elements:
  - name: Features
    type: text
    title_text: Features
    subtitle_text: In-depth usage stats of Petal Message features
    row: 79
    col: 0
    width: 24
    height: 2
  - name: Petal Message - Heat Map
    title: Petal Message - Heat Map
    model: petal
    explore: comments
    type: looker_map
    fields:
    - comments.regular_count
    - groups.name
    - location_geometries.geo_location
    filters:
      comments.created_date: 30 days ago for 30 days
      group_kinds.mnemonic: "-association"
      location_geometries.geo_location_bin_level: '9'
      location_geometries.geo_location: inside box from 55.7765730186677, -123.75000000000001
        to 40.979898069620155, -45
    sorts:
    - comments.regular_count desc
    limit: 5000
    query_timezone: America/New_York
    map_plot_mode: automagic_heatmap
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_latitude: 46.92635183322409
    map_longitude: -83.63307952880861
    map_zoom: 5
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: true
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    row: 68
    col: 0
    width: 24
    height: 11
  - name: Petal Message - Unique users all-time
    title: Petal Message - Unique users all-time
    model: petal
    explore: comments
    type: single_value
    fields:
    - comments.number_of_unique_accounts
    limit: 500
    query_timezone: America/New_York
    series_types: {}
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 0
    col: 20
    width: 4
    height: 4
  - name: Petal Message - Weekly Activity by Kind
    title: Petal Message - Weekly Activity by Kind
    model: petal
    explore: comments
    type: looker_pie
    fields:
    - comments.regular_count
    - account_kinds.simplified_mnemonic
    filters:
      comments.created_date: 12 weeks ago for 12 weeks
    sorts:
    - comments.regular_count desc
    limit: 500
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    series_colors:
      average_per_user: "#1f3e5a"
    series_labels:
      comments.regular_count: Comments
      accounts.confirmed_count: Unique Users
      average_per_user: Messages/User
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: comments.regular_count
        name: Regular Count
        axisId: comments.regular_count
      - id: accounts.confirmed_count
        name: Confirmed Count
        axisId: accounts.confirmed_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: average_per_user
        name: Average per user
        axisId: average_per_user
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 4
    col: 16
    width: 8
    height: 9
  - name: Petal Message - Weekly Usage
    title: Petal Message - Weekly Usage
    model: petal
    explore: comments
    type: looker_column
    fields:
    - comments.regular_count
    - accounts.confirmed_count
    - comments.created_week
    fill_fields:
    - comments.created_week
    filters:
      comments.created_date: 12 weeks ago for 12 weeks
    sorts:
    - comments.created_week
    limit: 500
    dynamic_fields:
    - table_calculation: average_per_user
      label: Average per user
      expression: "${comments.regular_count}/${accounts.confirmed_count}"
      value_format:
      value_format_name: decimal_2
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
      average_per_user: "#1f3e5a"
    series_labels:
      comments.regular_count: Comments
      accounts.confirmed_count: Unique Users
      average_per_user: Messages/User
    series_types:
      average_per_user: line
    limit_displayed_rows: false
    hidden_series: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: comments.regular_count
        name: Regular Count
        axisId: comments.regular_count
      - id: accounts.confirmed_count
        name: Confirmed Count
        axisId: accounts.confirmed_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: average_per_user
        name: Average per user
        axisId: average_per_user
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 4
    col: 0
    width: 16
    height: 9
  - name: Petal Message - Groups Ranking
    title: Petal Message - Groups Ranking
    model: petal
    explore: comments
    type: table
    fields:
    - groups.name
    - centres.name
    - specialties.description_en
    - group_kinds.mnemonic
    - comments.regular_count
    - centres.cohort
    - comments.created_week
    pivots:
    - comments.created_week
    fill_fields:
    - comments.created_week
    filters:
      comments.created_week: 12 weeks ago for 12 weeks
    sorts:
    - comments.regular_count desc 0
    - comments.created_week
    limit: 50
    dynamic_fields:
    - table_calculation: trend
      label: Trend
      expression: "(${comments.regular_count} - pivot_offset(${comments.regular_count},\
        \ -1))/pivot_offset(${comments.regular_count}, -1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      groups.name: Name
      specialties.description_en: Specialty
      group_kinds.mnemonic: Kind
      centres.name: Hospital
      centres.cohort: Cohort
      comments.regular_count: Messages
      comments.created_week: Week of
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: greater than
      value: 0
      background_color: "#b2df8a"
      font_color: "#33a02c"
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
      - trend
    - type: less than
      value: 0
      background_color: "#fb9a99"
      font_color: "#e31a1c"
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
      - trend
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - hidden_trend
    series_types: {}
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 23
    col: 0
    width: 24
    height: 10
  - name: Petal Message - Top 100 Accounts
    title: Petal Message - Top 100 Accounts
    model: petal
    explore: comments
    type: table
    fields:
    - accounts.first_name
    - accounts.last_name
    - specialties.description_en
    - account_kinds.simplified_mnemonic
    - locations.area_level_1
    - comments.regular_count
    - accounts.groups_acronym
    - comments.created_month
    pivots:
    - comments.created_month
    fill_fields:
    - comments.created_month
    filters:
      comments.created_month: 1 month ago for 1 month, 2 months ago for 1 month
    sorts:
    - comments.regular_count desc 0
    - comments.created_month
    limit: 100
    dynamic_fields:
    - table_calculation: hidden_trend
      label: Hidden Trend
      expression: "(${comments.regular_count} - pivot_offset(${comments.regular_count},\
        \ -1))/pivot_offset(${comments.regular_count}, -1)"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: groups
      label: Groups
      expression: pivot_index(${accounts.groups_acronym}, 1)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: string
    - table_calculation: trend
      label: Trend
      expression: pivot_index(${hidden_trend}, 2)
      value_format:
      value_format_name: percent_1
      _kind_hint: supermeasure
      _type_hint: number
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      accounts.first_name: First name
      accounts.last_name: Last name
      specialties.description_en: Specialty
      accounts.groups_acronym: Groups
      comments.regular_count: Regular
      comments.change_request_count: Change Request
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: greater than
      value: 0
      background_color: "#b2df8a"
      font_color: "#33a02c"
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
      - trend
    - type: less than
      value: 0
      background_color: "#fb9a99"
      font_color: "#e31a1c"
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
      - trend
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - accounts.groups_acronym
    - hidden_trend
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 33
    col: 0
    width: 24
    height: 18
  - name: Petal Message - Hospitals Ranking
    title: Petal Message - Hospitals Ranking
    model: petal
    explore: comments
    type: table
    fields:
    - centres.name
    - comments.regular_count
    - locations.area_level_1
    - centres.cohort
    - comments.created_week
    pivots:
    - comments.created_week
    fill_fields:
    - comments.created_week
    filters:
      comments.created_week: 12 weeks ago for 12 weeks
    sorts:
    - comments.regular_count desc 0
    - comments.created_week
    limit: 50
    column_limit: 50
    dynamic_fields:
    - table_calculation: trend
      label: Trend
      expression: "(${comments.regular_count} - pivot_offset(${comments.regular_count},\
        \ -1))/pivot_offset(${comments.regular_count}, -1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      groups.name: Name
      specialties.description_en: Specialty
      group_kinds.mnemonic: Kind
      locations.area_level_1: Province
      centres.name: Hospital
      centres.cohort: Cohort
      comments.regular_count: Messages
      comments.created_week: Week
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: greater than
      value: 0
      background_color: "#b2df8a"
      font_color: "#33a02c"
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
      - trend
    - type: less than
      value: 0
      background_color: "#fb9a99"
      font_color: "#e31a1c"
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
      - trend
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    - hidden_trend
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 13
    col: 0
    width: 24
    height: 10
  - name: Urgent Messages by Kind
    title: Urgent Messages by Kind
    model: petal
    explore: discussions
    type: looker_pie
    fields:
    - discussions.count
    - account_kinds.simplified_mnemonic
    filters:
      discussions.created_week: 12 weeks ago for 12 weeks
      discussions.urgent: 'Yes'
    sorts:
    - discussions.count desc
    limit: 500
    column_limit: 50
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 60
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
    series_colors:
      discussions.count: "#fb9a99"
    series_labels:
      discussions.count: Messages
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Week of
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
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 81
    col: 8
    width: 4
    height: 8
  - name: Petal Message - Monthly YoY
    title: Petal Message - Monthly YoY
    model: petal
    explore: comments
    type: looker_column
    fields:
    - comments.regular_count
    - comments.created_month_only
    - comments.created_year
    - comments.number_of_unique_accounts
    pivots:
    - comments.created_year
    fill_fields:
    - comments.created_year
    filters:
      comments.created_year: 2017, 2018, 2019
    sorts:
    - comments.created_month_only
    - comments.created_year
    limit: 500
    dynamic_fields:
    - table_calculation: commentsusermonth
      label: Comments/User/Month
      expression: "${comments.regular_count}/${comments.number_of_unique_accounts}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
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
    point_style: circle
    series_colors:
      2019 - commentsusermonth: "#928fb4"
    series_labels:
      2017 - comments.regular_count: 2017 - Comments
      2017 - comments.number_of_unique_accounts: 2017 - Unique Users
      2017 - commentsusermonth: 2017 - Average usage
      2018 - comments.regular_count: 2018 - Comments
      2018 - comments.number_of_unique_accounts: 2018 - Unique Users
      2018 - commentsusermonth: 2018 - Average usage
      2019 - comments.regular_count: 2019 - Comments
      2019 - comments.number_of_unique_accounts: 2019 - Unique Users
      2019 - commentsusermonth: Average Usage
    series_types:
      difference_yoy: line
      2019 - commentsusermonth: line
      2018 - commentsusermonth: line
      2017 - commentsusermonth: line
    limit_displayed_rows: false
    hidden_series:
    - 2017-01 - comments.regular_count
    - 2017 - comments.number_of_unique_accounts
    - 2018 - comments.number_of_unique_accounts
    - 2019 - comments.number_of_unique_accounts
    - 2017 - commentsusermonth
    - 2018 - commentsusermonth
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: 2017 - comments.regular_count
        name: 2017 - Comments Regular Count
        axisId: comments.regular_count
      - id: 2018 - comments.regular_count
        name: 2018 - Comments Regular Count
        axisId: comments.regular_count
      - id: 2019 - comments.regular_count
        name: 2019 - Comments Regular Count
        axisId: comments.regular_count
      - id: 2017 - comments.number_of_unique_accounts
        name: 2017 - Comments Number of Unique Accounts
        axisId: comments.number_of_unique_accounts
      - id: 2018 - comments.number_of_unique_accounts
        name: 2018 - Comments Number of Unique Accounts
        axisId: comments.number_of_unique_accounts
      - id: 2019 - comments.number_of_unique_accounts
        name: 2019 - Comments Number of Unique Accounts
        axisId: comments.number_of_unique_accounts
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: 2017 - commentsusermonth
        name: 2017 - Comments/User/Month
        axisId: commentsusermonth
      - id: 2018 - commentsusermonth
        name: 2018 - Comments/User/Month
        axisId: commentsusermonth
      - id: 2019 - commentsusermonth
        name: 2019 - Comments/User/Month
        axisId: commentsusermonth
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
    x_axis_label: Month
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 51
    col: 8
    width: 16
    height: 8
  - name: Petal Message - Urgent Messages
    title: Petal Message - Urgent Messages
    model: petal
    explore: discussions
    type: looker_column
    fields:
    - discussions.count
    - discussions.created_week
    fill_fields:
    - discussions.created_week
    filters:
      discussions.urgent: 'Yes'
      discussions.created_week: 12 weeks ago for 12 weeks
    sorts:
    - discussions.created_week desc
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
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      discussions.count: "#fb9a99"
    series_labels:
      discussions.count: Messages
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Week of
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
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 81
    col: 0
    width: 8
    height: 8
  - name: Petal Message Top 10 Specialties
    title: Petal Message Top 10 Specialties
    model: petal
    explore: comments
    type: looker_pie
    fields:
    - comments.regular_count
    - specialties.description_en
    filters:
      comments.created_week: 12 weeks ago for 12 weeks
    sorts:
    - comments.regular_count desc
    limit: 10
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    series_types: {}
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 51
    col: 0
    width: 8
    height: 8
  - name: Petal Message - Full Activity
    title: Petal Message - Full Activity
    model: petal
    explore: comments
    type: looker_area
    fields:
    - comments.regular_count
    - comments.created_week
    - comments.change_request_count
    fill_fields:
    - comments.created_week
    filters:
      comments.created_week: 12 weeks ago for 12 weeks
    sorts:
    - comments.created_week desc
    dynamic_fields:
    - table_calculation: percent_of_previous
      label: Percent of Previous
      expression: "${comments.regular_count} / offset(${comments.regular_count}, 1)\
        \ - 1"
      value_format: "#.#%"
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    stacking: normal
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    hidden_fields:
    - calculation_3
    - percent_of_previous
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 59
    col: 12
    width: 12
    height: 9
  - name: Weekday Activity
    title: Weekday Activity
    model: petal
    explore: comments
    type: looker_bar
    fields:
    - comments.regular_count
    - comments.created_day_of_week
    fill_fields:
    - comments.created_day_of_week
    filters:
      comments.created_date: 12 weeks ago for 12 weeks
    sorts:
    - comments.regular_count desc
    limit: 500
    total: true
    dynamic_fields:
    - table_calculation: percentage
      label: Percentage
      expression: "${comments.regular_count}/${comments.regular_count:total}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
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
    series_colors:
      comments.regular_count: "#928fb4"
      percentage: "#9fc190"
    series_labels:
      comments.regular_count: Comments
      accounts.confirmed_count: Unique Users
      average_per_user: Messages/User
    series_types: {}
    limit_displayed_rows: false
    hidden_series: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: comments.regular_count
        name: Regular Count
        axisId: comments.regular_count
      - id: accounts.confirmed_count
        name: Confirmed Count
        axisId: accounts.confirmed_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: average_per_user
        name: Average per user
        axisId: average_per_user
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    hidden_fields:
    - comments.regular_count
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 59
    col: 0
    width: 12
    height: 9
  - name: Petal Message - Forward Messages
    title: Petal Message - Forward Messages
    model: petal
    explore: discussions
    type: looker_column
    fields:
    - discussions.count
    - discussions.created_week
    fill_fields:
    - discussions.created_week
    filters:
      discussions.created_week: 12 weeks ago for 12 weeks
      discussions.forward_from_comment_id: NOT NULL
    sorts:
    - discussions.count desc
    limit: 500
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
    series_colors:
      discussions.count: "#9fc190"
    series_labels:
      discussions.count: Messages
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Week of
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
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 81
    col: 12
    width: 8
    height: 8
  - name: Forward Messages by Kind
    title: Forward Messages by Kind
    model: petal
    explore: discussions
    type: looker_pie
    fields:
    - discussions.count
    - account_kinds.simplified_mnemonic
    filters:
      discussions.created_week: 12 weeks ago for 12 weeks
      discussions.forward_from_comment_id: NOT NULL
    sorts:
    - discussions.count desc
    limit: 500
    query_timezone: America/New_York
    value_labels: legend
    label_type: labPer
    inner_radius: 60
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
    series_colors:
      discussions.count: "#fb9a99"
    series_labels:
      discussions.count: Messages
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Week of
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
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 81
    col: 20
    width: 4
    height: 8
  - name: Messages from Dashboard
    title: Messages from Dashboard
    model: petal
    explore: discussions
    type: looker_column
    fields:
    - discussions.created_week
    - discussions.count
    fill_fields:
    - discussions.created_week
    filters:
      discussions.from_console_layout_id: NOT NULL
      discussions.created_week: 12 weeks ago for 12 weeks
    sorts:
    - discussions.created_week desc
    limit: 500
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
      discussions.count: "#928fb4"
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 89
    col: 0
    width: 8
    height: 10
  - name: Messages sent in last month
    title: Messages sent in last month
    model: petal
    explore: comments
    type: single_value
    fields:
    - comments.regular_count
    - comments.created_month
    fill_fields:
    - comments.created_month
    filters:
      comments.created_week: 12 months ago for 12 months
    sorts:
    - comments.created_month desc
    dynamic_fields:
    - table_calculation: percent_of_previous
      label: Percent of Previous
      expression: "${comments.regular_count} / offset(${comments.regular_count}, 1)\
        \ - 1"
      value_format: "#.#%"
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    hidden_fields:
    - calculation_3
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 0
    col: 10
    width: 5
    height: 4
  - name: Messages sent last week
    title: Messages sent last week
    model: petal
    explore: comments
    type: single_value
    fields:
    - comments.created_week
    - comments.regular_count
    fill_fields:
    - comments.created_week
    filters:
      comments.created_week: 12 weeks ago for 12 weeks
    sorts:
    - comments.created_week desc
    dynamic_fields:
    - table_calculation: percent_of_previous
      label: Percent of Previous
      expression: "${comments.regular_count} / offset(${comments.regular_count}, 1)\
        \ - 1"
      value_format: "#.#%"
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
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
    value_labels: legend
    label_type: labPer
    inner_radius: 60
    hidden_fields:
    - comments.created_week
    - calculation_3
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 0
    col: 5
    width: 5
    height: 4
  - name: Petal Message - MAU
    title: Petal Message - MAU
    model: petal
    explore: active_users
    type: single_value
    fields:
    - active_users.user_count_active_30_days
    - active_users.date_month
    fill_fields:
    - active_users.date_month
    filters:
      active_users.date_month: 12 months ago for 12 months
    sorts:
    - active_users.date_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: percent_of_previous
      label: Percent of previous
      expression: "${active_users.user_count_active_30_days} / offset(${active_users.user_count_active_30_days}\
        \ , 1) - 1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    listen:
      Hospital: centres.name
      Cohort: centres.cohort
    row: 0
    col: 15
    width: 5
    height: 4
  - name: Messages With Attachments
    title: Messages With Attachments
    model: petal
    explore: comments
    type: looker_column
    fields:
    - comments.created_week
    - attachments.count
    - comments.regular_count
    fill_fields:
    - comments.created_week
    filters:
      comments.created_week: 12 weeks ago for 12 weeks
    sorts:
    - comments.created_week desc
    limit: 500
    dynamic_fields:
    - table_calculation: without_attachments
      label: Without Attachments
      expression: "${comments.regular_count} - ${attachments.count}"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
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
      attachments.count: With Attachments
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Week of
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - comments.regular_count
    row: 89
    col: 8
    width: 16
    height: 10
  - name: Messages sent yesterday
    title: Messages sent yesterday
    model: petal
    explore: comments
    type: single_value
    fields:
    - comments.created_date
    - comments.regular_count
    fill_fields:
    - comments.created_date
    filters:
      comments.created_date: 2 days ago for 2 days
    sorts:
    - comments.created_date desc
    limit: 500
    dynamic_fields:
    - table_calculation: percent_of_previous
      label: Percent of previous
      expression: "${comments.regular_count} / offset(${comments.regular_count}, 1)\
        \ - 1"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: true
    series_types: {}
    hidden_fields:
    - comments.created_date
    row: 0
    col: 0
    width: 5
    height: 4
  filters:
  - name: Hospital
    title: Hospital
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: petal
    explore: centres
    listens_to_filters: []
    field: centres.name
  - name: Cohort
    title: Cohort
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: petal
    explore: centres
    listens_to_filters: []
    field: centres.cohort
