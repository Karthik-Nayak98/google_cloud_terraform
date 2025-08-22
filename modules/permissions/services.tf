module "project-services" {
  source        = "terraform-google-modules/project-factory/google//modules/project_services"
  version       = "~> 18.0"
  project_id    = var.project_name
  activate_apis = var.gcp_services
  disable_dependent_services = true
}
