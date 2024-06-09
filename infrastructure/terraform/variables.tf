variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "us-central1"
}

variable "storage_bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}

variable "databricks_host" {
  description = "Databricks workspace host URL"
  type        = string
}

variable "databricks_token" {
  description = "Databricks personal access token"
  type        = string
  sensitive   = true
}

variable "looker_instance_name" {
  description = "Name of the Looker instance"
  type        = string
}

variable "looker_project_id" {
  description = "Looker project ID"
  type        = string
}

variable "looker_region" {
  description = "Looker region"
  type        = string
}
