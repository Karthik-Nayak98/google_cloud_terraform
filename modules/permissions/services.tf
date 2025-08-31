resource "google_project_service" "project_services" {
  project                    = var.project_name
  for_each                   = toset(var.gcp_services)
  service                    = each.value
  disable_dependent_services = true
  disable_on_destroy         = true
}

resource "google_project_service_identity" "cloudbuild_service_agent_sa" {
  provider   = google-beta
  project    = var.project_name
  service    = "cloudbuild.googleapis.com"
  depends_on = [google_project_service.project_services]
}
