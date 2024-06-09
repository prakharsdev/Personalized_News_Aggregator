resource "databricks_cluster" "cluster" {
  cluster_name            = "news-aggregator-cluster"
  spark_version           = "7.3.x-scala2.12"
  node_type_id            = "i3.xlarge"
  autotermination_minutes = 30
  num_workers             = 2
}

output "cluster_id" {
  value = databricks_cluster.cluster.id
}
