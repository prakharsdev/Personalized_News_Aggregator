provider "google" {
  project = var.project_id
  region  = var.region
}

provider "databricks" {
  host  = var.databricks_host
  token = var.databricks_token
}

module "gcp_infrastructure" {
  source        = "./modules/gcp"
  project_id    = var.project_id
  region        = var.region
  storage_bucket_name = var.storage_bucket_name
}

module "databricks_infrastructure" {
  source        = "./modules/databricks"
  databricks_host = var.databricks_host
  databricks_token = var.databricks_token
}

module "looker_infrastructure" {
  source        = "./modules/looker"
  looker_instance_name = var.looker_instance_name
  looker_project_id = var.project_id
  looker_region = var.region
}

output "storage_bucket_name" {
  value = module.gcp_infrastructure.storage_bucket_name
}

output "databricks_cluster_id" {
  value = module.databricks_infrastructure.cluster_id
}

output "looker_instance_url" {
  value = module.looker_infrastructure.instance_url
}
