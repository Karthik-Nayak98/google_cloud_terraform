module "gcp_cicd" {
  source                = "./modules/gcp_cicd"
  project_name          = var.project_name
  region                = var.region
  gitpat_secret         = var.gitpat_secret
  github_repository     = var.github_repository
  github_repository_url = var.github_repository_url
  gcp_services          = var.gcp_services
  app_installation_id   = var.app_installation_id
}

module "permissions" {
  source       = "./modules/permissions"
  project_name = var.project_name
  region       = var.region
}
