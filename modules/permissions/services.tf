
resource "google_project_service" "serviceusage" {
  project = var.project_name
  service = "serviceusage.googleapis.com"
}

resource "google_project_service" "cloudapis" {
  project    = var.project_name
  service    = "cloudapis.googleapis.com"
  depends_on = [google_project_service.serviceusage]
}
module "project-services" {
  source        = "terraform-google-modules/project-factory/google//modules/project_services"
  version       = "~> 18.0"
  project_id    = var.project_name
  activate_apis = var.gcp_services
  depends_on    = [google_project_service.serviceusage, google_project_service.cloudapis]
}
