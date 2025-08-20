resource "google_project_service" "gcp_services" {
  project  = var.project_name
  for_each = var.gcp_services
  service  = each.key
}
