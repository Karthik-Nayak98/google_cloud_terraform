resource "google_service_account" "cloudbuild_service_account" {
  project                      = var.project_name
  account_id                   = "cloudbuild-sa"
  display_name                 = "Service account used for cloudbuild repository activities"
  create_ignore_already_exists = true
  depends_on                   = [google_project_service.project_services]
}
