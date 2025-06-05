- dashboard: data_quality_dashboard
  title: "Data Quality Dashboard"
  layout: newspaper
  preferred_viewer: dashboards-next

  filters:
  - name: table_name
    title: "Table Name"
    type: field_filter
    model: "your_model_name" # Replace with your model name
    explore: "your_explore_name" # Replace with your explore name
    field: data_source__table_id # Replace with your field name
    default_value: "" # Set a default value if needed

  - name: rule_name
    title: "Rule Name"
    type: field_filter
    model: "your_model_name" # Replace with your model name
    explore: "your_explore_name" # Replace with your explore name
    field: rule_name # Replace with your field name
    default_value: "" # Set a default value if needed

  - name: scan_date
    title: "Scan Date"
    type: date_filter
    model: "your_model_name" # Replace with your model name
    explore: "your_explore_name" # Replace with your explore name
    field: created_date # Replace with your field name
    default_value: "7 days" # Set a default value if needed

  elements:
  - name: "overall_data_quality_score"
    title: "Overall Data Quality Score"
    type: looker_single_value
    model: "your_model_name" # Replace with your model name
    explore: "your_explore_name" # Replace with your explore name
    measures: ["job_quality_result__score"] # Replace with your measure
    # Add other parameters as needed

  - name: "overall_pass_fail_rate"
    title: "Overall Pass/Fail Rate"
    type: looker_single_value
    model: "your_model_name" # Replace with your model name
    explore: "your_explore_name" # Replace with your explore name
    measures: ["job_quality_result__passed"] # Replace with your measure for passed count
    # Potentially requires a second measure for total count if 'job_quality_result__passed' is not already a percentage
    # Or use table calculations to derive the rate if 'job_quality_result__passed' is a boolean or count
    # Example using table calculation for a boolean 'passed' field:
    # table_calculations:
    # - name: "pass_rate"
    #   label: "Pass Rate"
    #   expression: "sum(if(${your_explore_name.job_quality_result__passed}, 1, 0)) / count(${your_explore_name.job_quality_result__passed})"
    #   value_format_name: percent_2
    # For this example, assuming job_quality_result__passed can be directly used or is already a rate.
    # Add other parameters as needed

  - name: "data_quality_rules_details"
    title: "Data Quality Rules Details"
    type: looker_grid # Using looker_grid for a table visualization
    model: "your_model_name" # Replace with your model name
    explore: "your_explore_name" # Replace with your explore name
    dimensions: [
        "rule_name",
        "data_source__table_id",
        "created_date"
    ]
    measures: [
        "rule_passed", # Assuming this is a measure that gives status, might need to be a dimension if it's a boolean field
        "job_quality_result__score",
        "job_rows_scanned",
        "rule_rows_passed",
        "rule_assertion_row_count"
    ]
    sorts: ["created_date desc"]
    limit: 500 # Adjust as needed
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    # Add other parameters as needed, like column formatting or conditional formatting

  - name: "data_quality_score_over_time"
    title: "Data Quality Score Over Time"
    type: looker_line # Using looker_line for a time-series chart
    model: "your_model_name" # Replace with your model name
    explore: "your_explore_name" # Replace with your explore name
    dimensions: ["created_date.date"] # Ensure this is a date dimension, .date or appropriate timeframe
    measures: ["job_quality_result__score"]
    pivots: [rule_name, data_source__table_id] # Allows users to select one for grouping
    sorts: ["created_date.date desc"]
    limit: 500 # Adjust as needed
    show_view_names: false
    # Add other parameters as needed, like y-axis configuration, colors, etc.
    listen: # This makes the chart listen to the dashboard filters
      table_name: your_explore_name.data_source__table_id # Adjust field name if necessary
      rule_name: your_explore_name.rule_name # Adjust field name if necessary
      scan_date: your_explore_name.created_date # Adjust field name if necessary

  # Add more elements as needed
