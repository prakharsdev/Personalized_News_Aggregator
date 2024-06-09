resource "looker_instance" "instance" {
  name   = var.looker_instance_name
  project = var.looker_project_id
  region = var.looker_region
}

output "instance_url" {
  value = looker_instance.instance.url
}
