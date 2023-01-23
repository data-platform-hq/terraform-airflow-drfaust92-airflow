terraform {
  required_version = ">= 1.0.0"
  required_providers {
    airflow = {
      source  = "DrFaust92/airflow"
      version = "0.10.0"
    }
  }
}
