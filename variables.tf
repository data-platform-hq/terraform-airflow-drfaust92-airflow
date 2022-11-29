variable "product_base_name" {
  description = "Cloud resources base name (used to create services)"
  type        = string
}

variable "conn_type" {
  description = "The connection type"
  type        = string
  default     = "google_cloud_platform"
}

variable "keys_path" {
  description = "Path to service accounts keys (Secrets module resources)"
  type        = map(any)
}

variable "airflow_vars" {
  description = "Set of Airflow variables"
  type        = map(any)
}
