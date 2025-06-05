# The name of this view in Looker is "Ibb Quality Check"
view: ibb_quality_check {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `luxottica_claudio.ibb_quality_check` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    description: "The creation time of the data scan."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_on ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Data Quality Job Configuration" in Explore.

  dimension: data_quality_job_configuration {
    type: string
    description: "Data quality job configuration."
    sql: ${TABLE}.data_quality_job_configuration ;;
  }

  dimension: data_quality_job_id {
    type: string
    description: "Data quality scan job id."
    sql: ${TABLE}.data_quality_job_id ;;
  }

  dimension: data_quality_scan__data_scan_id {
    type: string
    description: "The data scan id."
    sql: ${TABLE}.data_quality_scan.data_scan_id ;;
    group_label: "Data Quality Scan"
    group_item_label: "Data Scan ID"
  }

  dimension: data_quality_scan__display_name {
    type: string
    description: "The display name of the data scan."
    sql: ${TABLE}.data_quality_scan.display_name ;;
    group_label: "Data Quality Scan"
    group_item_label: "Display Name"
  }

  dimension: data_quality_scan__location {
    type: string
    description: "The location of the data scan."
    sql: ${TABLE}.data_quality_scan.location ;;
    group_label: "Data Quality Scan"
    group_item_label: "Location"
  }

  dimension: data_quality_scan__project_id {
    type: string
    description: "The project id of the data scan."
    sql: ${TABLE}.data_quality_scan.project_id ;;
    group_label: "Data Quality Scan"
    group_item_label: "Project ID"
  }

  dimension: data_quality_scan__resource_name {
    type: string
    description: "The full resource name of the data scan."
    sql: ${TABLE}.data_quality_scan.resource_name ;;
    group_label: "Data Quality Scan"
    group_item_label: "Resource Name"
  }

  dimension: data_source__dataplex_entity_id {
    type: string
    description: "Data source - the entity id of the source dataplex entity."
    sql: ${TABLE}.data_source.dataplex_entity_id ;;
    group_label: "Data Source"
    group_item_label: "Dataplex Entity ID"
  }

  dimension: data_source__dataplex_entity_project_id {
    type: string
    description: "Data source - the project id of the source dataplex entity."
    sql: ${TABLE}.data_source.dataplex_entity_project_id ;;
    group_label: "Data Source"
    group_item_label: "Dataplex Entity Project ID"
  }

  dimension: data_source__dataplex_entity_project_number {
    type: number
    description: "Data source - the project number of the source dataplex entity."
    sql: ${TABLE}.data_source.dataplex_entity_project_number ;;
    group_label: "Data Source"
    group_item_label: "Dataplex Entity Project Number"
  }

  dimension: data_source__dataplex_lake_id {
    type: string
    description: "Data source - the lake id of the source dataplex entity."
    sql: ${TABLE}.data_source.dataplex_lake_id ;;
    group_label: "Data Source"
    group_item_label: "Dataplex Lake ID"
  }

  dimension: data_source__dataplex_zone_id {
    type: string
    description: "Data source - the zone id of the source dataplex entity."
    sql: ${TABLE}.data_source.dataplex_zone_id ;;
    group_label: "Data Source"
    group_item_label: "Dataplex Zone ID"
  }

  dimension: data_source__dataset_id {
    type: string
    description: "Data source - the dataset id of the source BigQuery table."
    sql: ${TABLE}.data_source.dataset_id ;;
    group_label: "Data Source"
    group_item_label: "Dataset ID"
  }

  dimension: data_source__resource_name {
    type: string
    description: "The full resource name of the data source."
    sql: ${TABLE}.data_source.resource_name ;;
    group_label: "Data Source"
    group_item_label: "Resource Name"
  }

  dimension: data_source__table_id {
    type: string
    description: "Data source - the table id of the source BigQuery table."
    sql: ${TABLE}.data_source.table_id ;;
    group_label: "Data Source"
    group_item_label: "Table ID"
  }

  dimension: data_source__table_project_id {
    type: string
    description: "Data source - the project id of the source BigQuery table."
    sql: ${TABLE}.data_source.table_project_id ;;
    group_label: "Data Source"
    group_item_label: "Table Project ID"
  }

  dimension: data_source__table_project_number {
    type: number
    description: "Data source - the project number of the source BigQuery table."
    sql: ${TABLE}.data_source.table_project_number ;;
    group_label: "Data Source"
    group_item_label: "Table Project Number"
  }

  dimension: job_dimension_result {
    type: string
    description: "The dimension result of the data quality job."
    sql: ${TABLE}.job_dimension_result ;;
  }

  dimension_group: job_end {
    type: time
    description: "The end time of the data scan job."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.job_end_time ;;
  }

  dimension: job_labels {
    type: string
    description: "The data scan job labels."
    sql: ${TABLE}.job_labels ;;
  }

  dimension: job_quality_result__incremental_end {
    type: string
    description: "The incremental end row of the data scan."
    sql: ${TABLE}.job_quality_result.incremental_end ;;
    group_label: "Job Quality Result"
    group_item_label: "Incremental End"
  }

  dimension: job_quality_result__incremental_start {
    type: string
    description: "The incremental start row of the data scan."
    sql: ${TABLE}.job_quality_result.incremental_start ;;
    group_label: "Job Quality Result"
    group_item_label: "Incremental Start"
  }

  dimension: job_quality_result__passed {
    type: yesno
    description: "The result of whether all quality rules have passed."
    sql: ${TABLE}.job_quality_result.passed ;;
    group_label: "Job Quality Result"
    group_item_label: "Passed"
  }

  dimension: job_quality_result__score {
    type: number
    description: "The measure of how well the data quality is based on all rules results."
    sql: ${TABLE}.job_quality_result.score ;;
    group_label: "Job Quality Result"
    group_item_label: "Score"
  }

  dimension: job_rows_scanned {
    type: number
    description: "The number of rows that have been scanned during this data scan job."
    sql: ${TABLE}.job_rows_scanned ;;
  }

  dimension_group: job_start {
    type: time
    description: "The start time of the data scan job."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.job_start_time ;;
  }

  dimension_group: last_updated {
    type: time
    description: "The last updated time of the data scan."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: rule_assertion_row_count {
    type: number
    description: "The number of rows failing this rule."
    sql: ${TABLE}.rule_assertion_row_count ;;
  }

  dimension: rule_column {
    type: string
    description: "The column name in the source table of the rule runs against."
    sql: ${TABLE}.rule_column ;;
  }

  dimension: rule_description {
    type: string
    description: "Data quality rule description."
    sql: ${TABLE}.rule_description ;;
  }

  dimension: rule_dimension {
    type: string
    description: "Data quality rule dimension."
    sql: ${TABLE}.rule_dimension ;;
  }

  dimension: rule_evaluation_type {
    type: string
    description: "Data quality rule evaluation type."
    sql: ${TABLE}.rule_evaluation_type ;;
  }

  dimension: rule_failed_records_query {
    type: string
    description: "The failed records query of this rule."
    sql: ${TABLE}.rule_failed_records_query ;;
  }

  dimension: rule_name {
    type: string
    description: "Data quality rule name."
    sql: ${TABLE}.rule_name ;;
  }

  dimension: rule_parameters {
    type: string
    description: "Data quality rule parameters."
    sql: ${TABLE}.rule_parameters ;;
  }

  dimension: rule_passed {
    type: yesno
    description: "The result of whether this rule has passed."
    sql: ${TABLE}.rule_passed ;;
  }

  dimension: rule_rows_evaluated {
    type: number
    description: "The number of rows that have been evaluated for this rule."
    sql: ${TABLE}.rule_rows_evaluated ;;
  }

  dimension: rule_rows_null {
    type: number
    description: "The number of rows with null values for this rule."
    sql: ${TABLE}.rule_rows_null ;;
  }

  dimension: rule_rows_passed {
    type: number
    description: "The number of rows that have passed for this rule."
    sql: ${TABLE}.rule_rows_passed ;;
  }

  dimension: rule_rows_passed_percent {
    type: number
    description: "The percentage of rows that have passed for this rule."
    sql: ${TABLE}.rule_rows_passed_percent ;;
  }

  dimension: rule_threshold_percent {
    type: number
    description: "The minimum percent of passed rows required to pass this rule."
    sql: ${TABLE}.rule_threshold_percent ;;
  }

  dimension: rule_type {
    type: string
    description: "Data quality rule type."
    sql: ${TABLE}.rule_type ;;
  }
  measure: count {
    type: count
    drill_fields: [rule_name, data_source__resource_name, data_quality_scan__display_name, data_quality_scan__resource_name]
  }
}
