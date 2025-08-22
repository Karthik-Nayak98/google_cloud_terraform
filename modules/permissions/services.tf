resource "google_project_service" "project_services" {
  project                    = var.project_name
  for_each                   = toset(var.gcp_services)
  service = each.value
  disable_dependent_services = true
  disable_on_destroy         = true
}
# module "project-services" {
#   source        = "terraform-google-modules/project-factory/google//modules/project_services"
#   version       = "~> 18.0"
#   project_id    = var.project_name
#   activate_apis = var.gcp_services
#   depends_on    = [google_project_service.serviceusage, google_project_service.cloudapis]
# }
