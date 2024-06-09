resource "google_storage_bucket" {
  name     = var.storage_bucket_name
  location = var.region
}

output "storage_bucket_name" {
  value = google_storage_bucket.bucket.name
}
