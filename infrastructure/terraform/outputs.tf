output "storage_bucket_name" {
  description = "Name of the GCS bucket"
  value       = module.gcp_infrastructure.storage_bucket_name
}

output "databricks_cluster_id" {
  description = "ID of the Databricks cluster"
  value       = module.databricks_infrastructure.cluster_id
}

output "looker_instance_url" {
  description = "URL of the Looker instance"
  value       = module.looker_infrastructure.instance_url
}
