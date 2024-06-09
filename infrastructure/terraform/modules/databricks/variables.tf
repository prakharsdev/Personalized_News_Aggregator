variable "databricks_host" {
  description = "Databricks workspace host URL"
  type        = string
}

variable "databricks_token" {
  description = "Databricks personal access token"
  type        = string
  sensitive   = true
}
