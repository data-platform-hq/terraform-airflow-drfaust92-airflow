resource "airflow_connection" "raw_serverless_conn_id" {
  connection_id = "${var.product_base_name}-raw-serverless"
  conn_type     = var.conn_type
  extra         = tostring("{\"extra__google_cloud_platform__key_secret_name\" : \"${var.keys_path.raw-serverless}\", \"extra__google_cloud_platform__num_retries\" : 5, \"extra__google_cloud_platform__project\" : \"\", \"extra__google_cloud_platform__scope\" : \"\" }")
}

resource "airflow_connection" "raw_spark_conn_id" {
  connection_id = "${var.product_base_name}-raw-spark"
  conn_type     = var.conn_type
  extra         = tostring("{\"extra__google_cloud_platform__key_secret_name\" : \"${var.keys_path.raw-spark}\", \"extra__google_cloud_platform__num_retries\" : 5, \"extra__google_cloud_platform__project\" : \"\", \"extra__google_cloud_platform__scope\" : \"\" }")
  depends_on    = [airflow_connection.raw_serverless_conn_id]
}

resource "airflow_connection" "dp_spark_conn_id" {
  connection_id = "${var.product_base_name}-dp-spark"
  conn_type     = var.conn_type
  extra         = tostring("{\"extra__google_cloud_platform__key_secret_name\" : \"${var.keys_path.dp-spark}\", \"extra__google_cloud_platform__num_retries\" : 5, \"extra__google_cloud_platform__project\" : \"\", \"extra__google_cloud_platform__scope\" : \"\" }")
  depends_on    = [airflow_connection.raw_spark_conn_id]
}

resource "airflow_connection" "dp_serverless_conn_id" {
  connection_id = "${var.product_base_name}-dp-serverless"
  conn_type     = var.conn_type
  extra         = tostring("{\"extra__google_cloud_platform__key_secret_name\" : \"${var.keys_path.dp-serverless}\", \"extra__google_cloud_platform__num_retries\" : 5, \"extra__google_cloud_platform__project\" : \"\", \"extra__google_cloud_platform__scope\" : \"\" }")
  depends_on    = [airflow_connection.dp_spark_conn_id]
}


resource "airflow_variable" "raw_serverless_conn_id" {
  key        = "raw_serverless_conn_id"
  value      = airflow_connection.raw_serverless_conn_id.id
  depends_on = [airflow_connection.dp_serverless_conn_id]
}

resource "airflow_variable" "raw_spark_conn_id" {
  key        = "raw_spark_conn_id"
  value      = airflow_connection.raw_spark_conn_id.id
  depends_on = [airflow_variable.raw_serverless_conn_id]
}

resource "airflow_variable" "dp_serverless_conn_id" {
  key        = "dp_serverless_conn_id"
  value      = airflow_connection.dp_serverless_conn_id.id
  depends_on = [airflow_variable.raw_spark_conn_id]
}

resource "airflow_variable" "dp_spark_conn_id" {
  key        = "dp_spark_conn_id"
  value      = airflow_connection.dp_spark_conn_id.id
  depends_on = [airflow_variable.dp_serverless_conn_id]
}

resource "airflow_variable" "jdbc_username" {
  key        = "jdbc_username_secret"
  value      = var.airflow_vars.jdbc_username_secret
  depends_on = [airflow_variable.dp_spark_conn_id]
}

resource "airflow_variable" "jdbc_password" {
  key        = "jdbc_password_secret"
  value      = var.airflow_vars.jdbc_password_secret
  depends_on = [airflow_variable.jdbc_username]
}

resource "airflow_variable" "jdbc_url" {
  key        = "jdbc_url"
  value      = var.airflow_vars.jdbc_url
  depends_on = [airflow_variable.jdbc_password]
}

resource "airflow_variable" "project_id" {
  key        = "project_id"
  value      = var.airflow_vars.project_id
  depends_on = [airflow_variable.jdbc_url]
}

resource "airflow_variable" "region" {
  key        = "region"
  value      = var.airflow_vars.region
  depends_on = [airflow_variable.project_id]
}

resource "airflow_variable" "temp_bucket" {
  key        = "temp_bucket"
  value      = var.airflow_vars.temp_bucket
  depends_on = [airflow_variable.region]
}

resource "airflow_variable" "data_bucket" {
  key        = "data_bucket"
  value      = var.airflow_vars.data_bucket
  depends_on = [airflow_variable.temp_bucket]
}

resource "airflow_variable" "artifacts_bucket" {
  key        = "artifacts_bucket"
  value      = var.airflow_vars.artifacts_bucket
  depends_on = [airflow_variable.data_bucket]
}

resource "airflow_variable" "raw_dataset_id" {
  key        = "raw_dataset_id"
  value      = var.airflow_vars.raw_dataset_id
  depends_on = [airflow_variable.artifacts_bucket]
}

resource "airflow_variable" "raw_dataset_id_dp" {
  key        = "raw_dataset_id_dp"
  value      = var.airflow_vars.raw_dataset_id_dp
  depends_on = [airflow_variable.raw_dataset_id]
}

resource "airflow_variable" "data_product_dataset_id" {
  key        = "data_product_dataset_id"
  value      = var.airflow_vars.data_product_dataset_id
  depends_on = [airflow_variable.raw_dataset_id]
}

resource "airflow_variable" "data_product_dataset_id_dp" {
  key        = "data_product_dataset_id_dp"
  value      = var.airflow_vars.data_product_dataset_id_dp
  depends_on = [airflow_variable.data_product_dataset_id]
}

resource "airflow_variable" "dataflow_subnet" {
  key        = "dataflow_subnetwork"
  value      = var.airflow_vars.dataflow_subnetwork
  depends_on = [airflow_variable.data_product_dataset_id_dp]
}

resource "airflow_variable" "dataproc_subnet" {
  key        = "dataproc_subnetwork"
  value      = var.airflow_vars.dataproc_subnetwork
  depends_on = [airflow_variable.dataflow_subnet]
}

resource "airflow_variable" "dp_spark_sa" {
  key        = "dp_spark_sa"
  value      = var.airflow_vars.dp_spark_sa
  depends_on = [airflow_variable.dataproc_subnet]
}

resource "airflow_variable" "raw_spark_sa" {
  key        = "raw_spark_sa"
  value      = var.airflow_vars.raw_spark_sa
  depends_on = [airflow_variable.dp_spark_sa]
}
