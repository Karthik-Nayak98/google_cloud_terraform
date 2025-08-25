module "permissions" {
  source       = "./modules/permissions"
  project_name = var.project_name
  region       = var.region
  gcp_services = var.gcp_services
}
module "gcp_cicd" {
  source                = "./modules/gcp_cicd"
  project_name          = var.project_name
  region                = var.region
  gitpat_secret         = var.gitpat_secret
  github_repository     = var.github_repository
  github_owner          = var.github_owner
  github_repository_url = var.github_repository_url
  app_installation_id   = var.app_installation_id
  gcp_enabled_apis      = module.permissions.gcp_enabled_apis
  cloudbuild_sa         = module.permissions.cloudbuild_sa
  project_iam_bindings = module.permissions.iam_binding
}

