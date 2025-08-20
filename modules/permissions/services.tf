resource "google_project_service" "gcp_service" {
  project  = var.project_name
  for_each = string(var.gcp_service)
  service  = each.key
}
