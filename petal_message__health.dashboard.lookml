- dashboard: petal_message__health
  title: Petal Message - Health
  layout: newspaper
  elements:
  - name: Adoption
    type: text
    title_text: Adoption
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Engagement
    type: text
    title_text: Engagement
    row: 19
    col: 0
    width: 24
    height: 2
  - name: Retention
    type: text
    title_text: Retention
    row: 56
    col: 0
    width: 24
    height: 2
  - name: Stickiness
    type: text
    title_text: Stickiness
    row: 36
    col: 0
    width: 24
    height: 2
  - name: Petal Message - MD Activation Delay
    title: Petal Message - MD Activation Delay
    model: petal
    explore: account_first_comment
    type: looker_column
    fields:
    - account_first_comment.first_usage_delay_average
    - account_first_comment.confirmed_at_year
    - account_first_comment.confirmed_at_month
    pivots:
    - account_first_comment.confirmed_at_year
    fill_fields:
    - account_first_comment.confirmed_at_year
    filters:
      account_first_comment.first_usage_delay: ">=0"
      account_first_comment.confirmed_at: last 14 months, last 26 months
      account_kinds.is_doctor: 'Yes'
    sorts:
    - account_first_comment.confirmed_at_year 0
    - account_first_comment.confirmed_at_month desc
    limit: 500
    column_limit: 50
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle
    series_colors:
      account_first_comment.first_usage_delay_average: "#82c2ca"
      2017 - account_first_comment.first_usage_delay_average: "#928fb4"
      2018 - account_first_comment.first_usage_delay_average: "#9fc190"
      2019 - account_first_comment.first_usage_delay_average: "#1f3e5a"
    series_labels:
      account_first_comment.first_usage_less_15days: Less than 15 days
      account_first_comment.first_usage_less_30days: Less than 30 days
      account_first_comment.first_usage_less_60days: Less than 2 months
      account_first_comment.first_usage_less_90days: Less than 3 months
      account_first_comment.first_usage_less_180days: Less than 6 months
      account_first_comment.first_usage_less_365days: Less than a year
      account_first_comment.first_usage_more_365days: More than a year
      account_first_comment.first_usage_delay_average: "#82c2ca"
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Monthly cohorts
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 12
    col: 12
    width: 12
    height: 7
  - name: Petal Message - MD Weekly Activity
    title: Petal Message - MD Weekly Activity
    model: petal
    explore: comments
    type: looker_area
    fields:
    - comments.number_of_unique_accounts
    - comments.created_week
    - comments.regular_count
    fill_fields:
    - comments.created_week
    filters:
      comments.created_date: 90 days
      account_kinds.is_doctor: 'Yes'
    sorts:
    - comments.created_week desc
    limit: 500
    dynamic_fields:
    - table_calculation: weekly_activity_per_user
      label: Weekly Activity per user
      expression: "${comments.regular_count}/${comments.number_of_unique_accounts}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
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
      weekly_activity_per_user: "#6a3d9a"
    series_types: {}
    series_point_styles: {}
    limit_displayed_rows: false
    hidden_series:
    - accounts.confirmed_count
    - comments.regular_count
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
    hidden_fields:
    - comments.number_of_unique_accounts
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 21
    col: 12
    width: 12
    height: 9
  - name: Petal Message - Global Activation Delay
    title: Petal Message - Global Activation Delay
    model: petal
    explore: account_first_comment
    type: looker_column
    fields:
    - account_first_comment.first_usage_delay_average
    - account_first_comment.confirmed_at_year
    - account_first_comment.confirmed_at_month
    pivots:
    - account_first_comment.confirmed_at_year
    fill_fields:
    - account_first_comment.confirmed_at_year
    filters:
      account_first_comment.first_usage_delay: ">=0"
      account_first_comment.confirmed_at: last 13 months, last 25 months
    sorts:
    - account_first_comment.confirmed_at_year 0
    - account_first_comment.confirmed_at_month desc
    limit: 500
    column_limit: 50
    query_timezone: America/New_York
    stacking: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: circle
    series_colors:
      account_first_comment.first_usage_delay_average: "#82c2ca"
    series_labels:
      account_first_comment.first_usage_less_15days: Less than 15 days
      account_first_comment.first_usage_less_30days: Less than 30 days
      account_first_comment.first_usage_less_60days: Less than 2 months
      account_first_comment.first_usage_less_90days: Less than 3 months
      account_first_comment.first_usage_less_180days: Less than 6 months
      account_first_comment.first_usage_less_365days: Less than a year
      account_first_comment.first_usage_more_365days: More than a year
      account_first_comment.first_usage_delay_average: "#82c2ca"
    series_types: {}
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    x_axis_label: Monthly cohorts
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: true
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 12
    col: 0
    width: 12
    height: 7
  - name: Petal Messages - MD D10M Indicator
    title: Petal Messages - MD D10M Indicator
    model: petal
    explore: accounts
    type: looker_line
    fields:
    - accounts.confirmed_month
    - accounts.confirmed_count
    - account_tenth_comment.cohort_size_reached
    - account_tenth_comment.average_time_to_10
    fill_fields:
    - accounts.confirmed_month
    filters:
      accounts.confirmed_month: 12 months
      account_kinds.is_doctor: 'Yes'
    sorts:
    - accounts.confirmed_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: reached
      label: "% Reached"
      expression: "${account_tenth_comment.cohort_size_reached}/${accounts.confirmed_count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
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
    point_style: circle
    series_colors:
      account_tenth_comment.average_time_to_10: "#cab2d6"
      reached: "#6a3d9a"
    series_labels:
      account_tenth_comment.average_time_to_10: Average Delay
    series_types:
      account_tenth_comment.average_time_to_10: column
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: account_tenth_comment.average_time_to_10
        name: Average Time to 10
        axisId: account_tenth_comment.average_time_to_10
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: reached
        name: "% Reached"
        axisId: reached
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - accounts.confirmed_count
    - account_tenth_comment.cohort_size_reached
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 30
    col: 12
    width: 12
    height: 6
  - name: Petal Messages - Global D10M Indicator
    title: Petal Messages - Global D10M Indicator
    model: petal
    explore: accounts
    type: looker_line
    fields:
    - accounts.confirmed_month
    - accounts.confirmed_count
    - account_tenth_comment.cohort_size_reached
    - account_tenth_comment.average_time_to_10
    fill_fields:
    - accounts.confirmed_month
    filters:
      accounts.confirmed_month: 12 months
    sorts:
    - accounts.confirmed_month desc
    limit: 500
    dynamic_fields:
    - table_calculation: reached
      label: "% Reached"
      expression: "${account_tenth_comment.cohort_size_reached}/${accounts.confirmed_count}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
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
    point_style: circle
    series_colors: {}
    series_labels:
      account_tenth_comment.average_time_to_10: Average Delay
    series_types:
      account_tenth_comment.average_time_to_10: column
    limit_displayed_rows: false
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: account_tenth_comment.average_time_to_10
        name: Average Time to 10
        axisId: account_tenth_comment.average_time_to_10
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: reached
        name: "% Reached"
        axisId: reached
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
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - accounts.confirmed_count
    - account_tenth_comment.cohort_size_reached
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 30
    col: 0
    width: 12
    height: 6
  - name: Petal Message - Global Weekly Activity
    title: Petal Message - Global Weekly Activity
    model: petal
    explore: comments
    type: looker_area
    fields:
    - comments.number_of_unique_accounts
    - comments.created_week
    - comments.regular_count
    fill_fields:
    - comments.created_week
    filters:
      comments.created_date: 90 days
    sorts:
    - comments.created_week desc
    limit: 500
    dynamic_fields:
    - table_calculation: weekly_activity_per_user
      label: Weekly Activity per user
      expression: "${comments.regular_count}/${comments.number_of_unique_accounts}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
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
    series_colors: {}
    series_types: {}
    series_point_styles: {}
    limit_displayed_rows: false
    hidden_series:
    - accounts.confirmed_count
    - comments.regular_count
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
    hidden_fields:
    - comments.number_of_unique_accounts
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 21
    col: 0
    width: 12
    height: 9
  - name: Petal Message - Global Stickiness
    title: Petal Message - Global Stickiness
    model: petal
    explore: active_users
    type: looker_area
    fields:
    - active_users.date_date
    - active_users.user_count_active_this_day
    - active_users.user_count_active_30_days
    fill_fields:
    - active_users.date_date
    filters:
      active_users.date_date: 90 days
    sorts:
    - active_users.date_date
    limit: 500
    dynamic_fields:
    - table_calculation: stickiness_hidden
      label: Stickiness (Hidden)
      expression: "${active_users.user_count_active_this_day}/${active_users.user_count_active_30_days}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: stickiness
      label: Stickiness
      expression: mean(offset_list(${active_users.user_count_active_this_day}/${active_users.user_count_active_30_days},
        -6, 7))
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
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors: {}
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '1'
    hidden_series: []
    y_axes:
    - label:
      orientation: right
      series:
      - id: stickiness
        name: Stickiness
        axisId: stickiness
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 0
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
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: center
      color: "#a9c574"
      line_value: median
      range_start: '0.2'
      range_end: '0.1'
      label: Industry Standards
    trend_lines: []
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - active_users.user_count_active_this_day
    - active_users.user_count_active_30_days
    - stickiness_hidden
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 38
    col: 0
    width: 12
    height: 9
  - name: Petal Message - MD Stickiness
    title: Petal Message - MD Stickiness
    model: petal
    explore: active_users
    type: looker_area
    fields:
    - active_users.date_date
    - active_users.user_count_active_this_day
    - active_users.user_count_active_30_days
    fill_fields:
    - active_users.date_date
    filters:
      active_users.date_date: 90 days
      account_kinds.is_doctor: 'Yes'
    sorts:
    - active_users.date_date
    limit: 500
    dynamic_fields:
    - table_calculation: stickiness_hidden
      label: Stickiness (Hidden)
      expression: "${active_users.user_count_active_this_day}/${active_users.user_count_active_30_days}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: stickiness
      label: Stickiness
      expression: mean(offset_list(${active_users.user_count_active_this_day}/${active_users.user_count_active_30_days},
        -6, 7))
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
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      stickiness: "#928fb4"
    series_types: {}
    limit_displayed_rows: false
    limit_displayed_rows_values:
      show_hide: hide
      first_last: last
      num_rows: '1'
    hidden_series: []
    y_axes:
    - label:
      orientation: right
      series:
      - id: stickiness
        name: Stickiness
        axisId: stickiness
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 0
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
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: center
      color: "#a9c574"
      line_value: median
      range_start: '0.2'
      range_end: '0.1'
      label: Industry Standards
    trend_lines: []
    show_null_points: true
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - active_users.user_count_active_this_day
    - active_users.user_count_active_30_days
    - stickiness_hidden
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 38
    col: 12
    width: 12
    height: 9
  - name: Petal Message - Global DAU/WAU/MAU
    title: Petal Message - Global DAU/WAU/MAU
    model: petal
    explore: active_users
    type: looker_line
    fields:
    - active_users.date_date
    - active_users.user_count_active_this_day
    - active_users.user_count_active_7_days
    - active_users.user_count_active_30_days
    fill_fields:
    - active_users.date_date
    filters:
      active_users.date_date: 60 days
    sorts:
    - active_users.date_date
    limit: 500
    dynamic_fields:
    - table_calculation: rolling_mau
      label: Rolling MAU
      expression: mean(offset_list(${active_users.user_count_active_30_days}, -6,
        7))
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: rolling_dau
      label: Rolling DAU
      expression: mean(offset_list(${active_users.user_count_active_this_day}, -6,
        7))
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: rolling_wau
      label: Rolling WAU
      expression: mean(offset_list(${active_users.user_count_active_7_days}, -6, 7))
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
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
    series_colors: {}
    series_labels:
      active_users.user_count_active_this_day: DAU
      active_users.user_count_active_7_days: WAU
      active_users.user_count_active_30_days: MAU
      rolling_mau: MAU
      rolling_dau: DAU
      rolling_wau: WAU
    series_types:
      active_users.user_count_active_this_day: column
      rolling_dau: column
    limit_displayed_rows: false
    hidden_series: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: rolling_dau
        name: DAU
        axisId: rolling_dau
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: rolling_wau
        name: WAU
        axisId: rolling_wau
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: rolling_mau
        name: MAU
        axisId: rolling_mau
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
    show_null_points: true
    interpolation: linear
    hidden_fields:
    - active_users.user_count_active_30_days
    - active_users.user_count_active_7_days
    - active_users.user_count_active_this_day
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 47
    col: 0
    width: 12
    height: 9
  - name: Petal Message - MD DAU/WAU/MAU
    title: Petal Message - MD DAU/WAU/MAU
    model: petal
    explore: active_users
    type: looker_line
    fields:
    - active_users.date_date
    - active_users.user_count_active_this_day
    - active_users.user_count_active_7_days
    - active_users.user_count_active_30_days
    fill_fields:
    - active_users.date_date
    filters:
      active_users.date_date: 60 days
      account_kinds.is_doctor: 'Yes'
    sorts:
    - active_users.date_date
    limit: 500
    dynamic_fields:
    - table_calculation: rolling_mau
      label: Rolling MAU
      expression: mean(offset_list(${active_users.user_count_active_30_days}, -6,
        7))
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: rolling_dau
      label: Rolling DAU
      expression: mean(offset_list(${active_users.user_count_active_this_day}, -6,
        7))
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    - table_calculation: rolling_wau
      label: Rolling WAU
      expression: mean(offset_list(${active_users.user_count_active_7_days}, -6, 7))
      value_format:
      value_format_name: decimal_0
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    stacking: ''
    colors:
    - "#8dd3c7"
    - "#ffed6f"
    - "#bebada"
    - "#fb8072"
    - "#80b1d3"
    - "#fdb462"
    - "#b3de69"
    - "#fccde5"
    - "#d9d9d9"
    - "#bc80bd"
    - "#ccebc5"
    - "#a3a3ff"
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      rolling_dau: "#bebada"
      rolling_wau: "#ffed6f"
    series_labels:
      active_users.user_count_active_this_day: DAU
      active_users.user_count_active_7_days: WAU
      active_users.user_count_active_30_days: MAU
      rolling_mau: MAU
      rolling_dau: DAU
      rolling_wau: WAU
    series_types:
      active_users.user_count_active_this_day: column
      rolling_dau: column
    limit_displayed_rows: false
    hidden_series: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: rolling_dau
        name: DAU
        axisId: rolling_dau
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: rolling_wau
        name: WAU
        axisId: rolling_wau
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: rolling_mau
        name: MAU
        axisId: rolling_mau
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
    show_null_points: true
    interpolation: linear
    hidden_fields:
    - active_users.user_count_active_30_days
    - active_users.user_count_active_7_days
    - active_users.user_count_active_this_day
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 47
    col: 12
    width: 12
    height: 9
  - name: Petal Message - Retention by Cohort
    title: Petal Message - Retention by Cohort
    model: petal
    explore: monthly_activity_comments
    type: table
    fields:
    - monthly_activity_comments.months_since_signup
    - monthly_activity_comments.percent_of_cohort_active
    - monthly_activity_comments.signup_month
    pivots:
    - monthly_activity_comments.signup_month
    fill_fields:
    - monthly_activity_comments.signup_month
    filters:
      monthly_activity_comments.months_since_signup: "<=13"
      monthly_activity_comments.signup_month: 13 months
    sorts:
    - monthly_activity_comments.signup_month 0
    - monthly_activity_comments.months_since_signup
    limit: 500
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      monthly_activity_comments.months_since_signup: Months Since Signup
      monthly_activity_comments.signup_month: Cohort
      monthly_activity_comments.percent_of_cohort_active: Active
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#1f78b4"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - monthly_activity_comments.percent_of_cohort_active
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_types: {}
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
    show_null_points: false
    interpolation: monotone
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 58
    col: 0
    width: 12
    height: 8
  - name: Petal Message - Retention by Cohort (MD)
    title: Petal Message - Retention by Cohort (MD)
    model: petal
    explore: monthly_activity_comments
    type: table
    fields:
    - monthly_activity_comments.months_since_signup
    - monthly_activity_comments.percent_of_cohort_active
    - monthly_activity_comments.signup_month
    pivots:
    - monthly_activity_comments.signup_month
    fill_fields:
    - monthly_activity_comments.signup_month
    filters:
      monthly_activity_comments.months_since_signup: "<=13"
      monthly_activity_comments.signup_month: 13 months
      account_kinds.is_doctor: 'Yes'
    sorts:
    - monthly_activity_comments.signup_month 0
    - monthly_activity_comments.months_since_signup
    limit: 500
    query_timezone: America/New_York
    show_view_names: true
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      monthly_activity_comments.months_since_signup: Months Since Signup
      monthly_activity_comments.signup_month: Cohort
      monthly_activity_comments.percent_of_cohort_active: Active
    table_theme: gray
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting:
    - type: low to high
      value:
      background_color:
      font_color:
      palette:
        name: Custom
        colors:
        - "#FFFFFF"
        - "#6a3d9a"
      bold: false
      italic: false
      strikethrough: false
      fields:
      - monthly_activity_comments.percent_of_cohort_active
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    point_style: none
    series_types: {}
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
    show_null_points: false
    interpolation: monotone
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 58
    col: 12
    width: 12
    height: 8
  - name: Petal Message - Global Pulse/CRR
    title: Petal Message - Global Pulse/CRR
    model: petal
    explore: comments_retention_lifecycle
    type: looker_column
    fields:
    - comments_retention_lifecycle.yearmonth
    - comments_retention_lifecycle.new_count
    - comments_retention_lifecycle.current_count
    - comments_retention_lifecycle.resuscitated_count
    - comments_retention_lifecycle.sleeping_count
    filters:
      comments_retention_lifecycle.the_date: 13 months
    sorts:
    - comments_retention_lifecycle.yearmonth
    limit: 500
    dynamic_fields:
    - table_calculation: sleeping_count
      label: Sleeping Count
      expression: "-1*${comments_retention_lifecycle.sleeping_count}"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: pulse
      label: Pulse
      expression: abs((${comments_retention_lifecycle.new_count}+${comments_retention_lifecycle.resuscitated_count})/${comments_retention_lifecycle.sleeping_count})
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      _type_hint: number
    - table_calculation: crr
      label: CRR
      expression: "(${comments_retention_lifecycle.current_count} - ${comments_retention_lifecycle.new_count})/offset(${comments_retention_lifecycle.current_count},-1)"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
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
    series_colors: {}
    series_labels:
      comments_retention_lifecycle.new_count: New
      comments_retention_lifecycle.current_count: Current
      comments_retention_lifecycle.resuscitated_count: Resuscitated
      calculation_1: Sleeping
      sleeping_count: Sleeping
    series_types:
      pulse: line
    limit_displayed_rows: false
    hidden_series: []
    y_axes:
    - label:
      orientation: left
      series:
      - id: pulse
        name: Pulse
        axisId: pulse
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: crr
        name: CRR
        axisId: crr
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
    reference_lines:
    - reference_type: line
      range_start: max
      range_end: min
      margin_top: deviation
      margin_value: mean
      margin_bottom: deviation
      label_position: right
      color: "#569d31"
      line_value: '1'
      label: Benchmark
    trend_lines: []
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - comments_retention_lifecycle.sleeping_count
    - comments_retention_lifecycle.new_count
    - comments_retention_lifecycle.current_count
    - comments_retention_lifecycle.resuscitated_count
    - sleeping_count
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 66
    col: 12
    width: 12
    height: 9
  - name: Petal Message - Global Adoption
    title: Petal Message - Global Adoption
    model: petal
    explore: accounts
    type: looker_line
    fields:
    - accounts.confirmed_count
    - accounts.confirmed_week
    - comments.number_of_unique_accounts
    - accounts.deactivated_count
    fill_fields:
    - accounts.confirmed_week
    filters:
      accounts.confirmed_date: after 2010/04/10
    sorts:
    - accounts.confirmed_week
    limit: 1000
    dynamic_fields:
    - table_calculation: cumulative_confirmed_accounts
      label: Cumulative Confirmed Accounts
      expression: running_total(${accounts.confirmed_count})
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cumulative_petal_message_users
      label: Cumulative Petal Message Users
      expression: running_total(${comments.number_of_unique_accounts})
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: global_adoption
      label: Global Adoption %
      expression: "${cumulative_petal_message_users}/(${cumulative_confirmed_accounts}\
        \ + ${cumulative_deactivated_accounts})"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cumulative_deactivated_accounts
      label: Cumulative Deactivated Accounts
      expression: running_total(${accounts.deactivated_count})
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
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
      cumulative_petal_message_users: "#1f78b4"
      cumulative_confirmed_accounts: "#a6cee3"
      global_adoption: "#ff7f00"
    series_types:
      cumulative_confirmed_accounts: area
      cumulative_petal_message_users: area
    limit_displayed_rows: false
    hidden_series:
    - accounts.confirmed_count
    - comments.number_of_unique_accounts
    - accounts.deactivated_count
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: accounts.confirmed_count
        name: Confirmed Count
        axisId: accounts.confirmed_count
      - id: comments.number_of_unique_accounts
        name: Number of Unique Accounts
        axisId: comments.number_of_unique_accounts
      - id: cumulative_confirmed_accounts
        name: Cumulative Confirmed Accounts
        axisId: cumulative_confirmed_accounts
      - id: cumulative_petal_message_users
        name: Cumulative Petal Message Users
        axisId: cumulative_petal_message_users
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: global_adoption
        name: Global Adoption %
        axisId: global_adoption
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
    trend_lines: []
    show_null_points: true
    interpolation: linear
    hidden_fields:
    - accounts.confirmed_count
    - comments.number_of_unique_accounts
    - accounts.deactivated_count
    - cumulative_deactivated_accounts
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 2
    col: 0
    width: 12
    height: 10
  - name: Petal Message - Global Retention Lifecycle
    title: Petal Message - Global Retention Lifecycle
    model: petal
    explore: comments_retention_lifecycle
    type: looker_column
    fields:
    - comments_retention_lifecycle.yearmonth
    - comments_retention_lifecycle.new_count
    - comments_retention_lifecycle.current_count
    - comments_retention_lifecycle.resuscitated_count
    - comments_retention_lifecycle.sleeping_count
    filters:
      comments_retention_lifecycle.the_date: 12 months
    sorts:
    - comments_retention_lifecycle.yearmonth
    limit: 500
    dynamic_fields:
    - table_calculation: sleeping_count
      label: Sleeping Count
      expression: "-1*${comments_retention_lifecycle.sleeping_count}"
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/New_York
    stacking: normal
    colors:
    - "#8dd3c7"
    - "#ffed6f"
    - "#bebada"
    - "#fb8072"
    - "#80b1d3"
    - "#fdb462"
    - "#b3de69"
    - "#fccde5"
    - "#d9d9d9"
    - "#bc80bd"
    - "#ccebc5"
    - "#a3a3ff"
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    point_style: none
    series_colors:
      comments_retention_lifecycle.resuscitated_count: "#80b1d3"
      comments_retention_lifecycle.current_count: "#ccebc5"
      comments_retention_lifecycle.new_count: "#b3de69"
    series_labels:
      comments_retention_lifecycle.new_count: New
      comments_retention_lifecycle.current_count: Current
      comments_retention_lifecycle.resuscitated_count: Resuscitated
      calculation_1: Sleeping
      sleeping_count: Sleeping
    series_types:
      pulse: line
    limit_displayed_rows: false
    hidden_series: []
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: comments_retention_lifecycle.new_count
        name: New
        axisId: comments_retention_lifecycle.new_count
      - id: comments_retention_lifecycle.current_count
        name: Current
        axisId: comments_retention_lifecycle.current_count
      - id: comments_retention_lifecycle.resuscitated_count
        name: Resuscitated
        axisId: comments_retention_lifecycle.resuscitated_count
      - id: sleeping_count
        name: Sleeping
        axisId: sleeping_count
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      tickDensityCustom: 5
      type: linear
    - label:
      orientation: right
      series:
      - id: pulse
        name: Pulse
        axisId: pulse
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
    ordering: none
    show_null_labels: false
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields:
    - comments_retention_lifecycle.sleeping_count
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 66
    col: 0
    width: 12
    height: 9
  - name: Petal Message - MD Adoption
    title: Petal Message - MD Adoption
    model: petal
    explore: accounts
    type: looker_line
    fields:
    - accounts.confirmed_week
    - accounts.confirmed_count
    - comments.number_of_unique_accounts
    - accounts.deactivated_count
    fill_fields:
    - accounts.confirmed_week
    filters:
      accounts.confirmed_date: after 2010/04/10
      account_kinds.is_doctor: 'Yes'
    sorts:
    - accounts.confirmed_week
    limit: 1000
    column_limit: 50
    dynamic_fields:
    - table_calculation: cumulative_confirmed_accounts
      label: Cumulative Confirmed Accounts
      expression: running_total(${accounts.confirmed_count})
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cumulative_petal_message_users
      label: Cumulative Petal Message Users
      expression: running_total(${comments.number_of_unique_accounts})
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
    - table_calculation: global_adoption
      label: Global Adoption %
      expression: "${cumulative_petal_message_users}/(${cumulative_confirmed_accounts}\
        \ + ${cumulative_deactivated_accounts})"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: cumulative_deactivated_accounts
      label: Cumulative Deactivated Accounts
      expression: running_total(${accounts.deactivated_count})
      value_format:
      value_format_name:
      _kind_hint: measure
      _type_hint: number
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
      cumulative_petal_message_users: "#6a3d9a"
      cumulative_confirmed_accounts: "#cab2d6"
    series_types:
      cumulative_confirmed_accounts: area
      cumulative_petal_message_users: area
    limit_displayed_rows: false
    hidden_series:
    - accounts.confirmed_count
    - comments.number_of_unique_accounts
    y_axes:
    - label: ''
      orientation: left
      series:
      - id: accounts.confirmed_count
        name: Confirmed Count
        axisId: accounts.confirmed_count
      - id: comments.number_of_unique_accounts
        name: Number of Unique Accounts
        axisId: comments.number_of_unique_accounts
      - id: cumulative_confirmed_accounts
        name: Cumulative Confirmed Accounts
        axisId: cumulative_confirmed_accounts
      - id: cumulative_petal_message_users
        name: Cumulative Petal Message Users
        axisId: cumulative_petal_message_users
      showLabels: true
      showValues: true
      unpinAxis: false
      tickDensity: default
      type: linear
    - label:
      orientation: right
      series:
      - id: global_adoption
        name: Global Adoption %
        axisId: global_adoption
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
    trend_lines: []
    show_null_points: true
    interpolation: linear
    hidden_fields:
    - accounts.confirmed_count
    - comments.number_of_unique_accounts
    - cumulative_deactivated_accounts
    - accounts.deactivated_count
    listen:
      Centres: centres.name
      Groups: groups.name
      Messaging Cohort: centres.cohort
    row: 2
    col: 12
    width: 12
    height: 10
  filters:
  - name: Centres
    title: Centres
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: petal
    explore: centres
    listens_to_filters: []
    field: centres.cohort
  - name: Groups
    title: Groups
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: petal
    explore: centres
    listens_to_filters: []
    field: centres.cohort
  - name: Messaging Cohort
    title: Messaging Cohort
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: petal
    explore: centres
    listens_to_filters: []
    field: centres.cohort
