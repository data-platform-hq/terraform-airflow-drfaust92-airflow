# Airflow Terraform module
Terraform module for creation Airflow resources

## Usage

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_airflow"></a> [airflow](#requirement\_airflow)       | >= 0.7.0 |

## Providers

| Name                                                                | Version  |
| ------------------------------------------------------------------- | -------- |
| <a name="requirement_airflow"></a> [airflow](#requirement\_airflow) | >= 0.7.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                   | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [google_airflow_connection.raw_serverless_conn_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_connection) | resource |
| [google_airflow_connection.raw_spark_conn_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_connection)      | resource |
| [google_airflow_connection.dp_spark_conn_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_connection)       | resource |
| [google_airflow_connection.dp_serverless_conn_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_connection)  | resource |
| [google_airflow_variable.raw_serverless_conn_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)     | resource |
| [google_airflow_variable.raw_spark_conn_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)          | resource |
| [google_airflow_variable.dp_serverless_conn_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)      | resource |
| [google_airflow_variable.dp_spark_conn_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)           | resource |
| [google_airflow_variable.jdbc_username](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)              | resource |
| [google_airflow_variable.jdbc_password](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)              | resource |
| [google_airflow_variable.jdbc_url](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)                   | resource |
| [google_airflow_variable.project_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)                 | resource |
| [google_airflow_variable.region](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)                     | resource |
| [google_airflow_variable.temp_bucket](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)                | resource |
| [google_airflow_variable.data_bucket](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)                | resource |
| [google_airflow_variable.artifacts_bucket](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)           | resource |
| [google_airflow_variable.raw_dataset_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)             | resource |
| [google_airflow_variable.raw_dataset_id_dp](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)          | resource |
| [google_airflow_variable.data_product_dataset_id](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)    | resource |
| [google_airflow_variable.data_product_dataset_id_dp](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable) | resource |
| [google_airflow_variable.dataflow_subnet](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)            | resource |
| [google_airflow_variable.dataproc_subnet](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)            | resource |
| [google_airflow_variable.dp_spark_sa](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)                | resource |
| [google_airflow_variable.raw_spark_sa](https://registry.terraform.io/providers/DrFaust92/airflow/latest/docs/resources/airflow_variable)               | resource |

## Inputs

| Name                                                                                      | Description                                              | Type       | Default | Required |
| ----------------------------------------------------------------------------------------- | -------------------------------------------------------- | ---------- | ------- | :------: |
| <a name="input_product_base_name"></a> [product\_base\_name](#input\_product\_base\_name) | Cloud resources base name (used to create services)      | `string`   | n/a     |   yes    |
| <a name="input_conn_type"></a> [conn\_type](#input\_conn\_type)                           | The connection type                                      | `string`   | n/a     |   yes    |
| <a name="input_keys_path"></a> [keys\_path](#input\_keys\_path)                           | Path to service accounts keys (Secrets module resources) | `string`   | n/a     |   yes    |
| <a name="input_airflow_vars"></a> [airflow\_vars](#input\_airflow\_vars)                  | Set of Airflow variables                                 | `map(any)` | n/a     |   yes    |

## Outputs

No Outputs

<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-airflow-drfaust92-airflow/blob/main/LICENSE)
