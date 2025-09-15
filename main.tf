locals {
  project_number = data.google_project.project.number
}
module "permissions" {
  source                    = "./modules/permissions"
  project_name              = var.project_name
  region                    = var.region
  gcp_services              = var.gcp_services
  project_number            = local.project_number
  terraform_service_account = var.terraform_service_account
}
module "gcp_cicd" {
  source               = "./modules/gcp_cicd"
  project_name         = var.project_name
  region               = var.region
  gitpat_secret        = var.gitpat_secret
  github_owner         = var.github_owner
  github_repository    = var.github_repository
  app_installation_id  = var.app_installation_id
  gcp_enabled_apis     = module.permissions.gcp_enabled_apis
  cloudbuild_sa        = module.permissions.cloudbuild_sa
  project_iam_bindings = module.permissions.iam_binding
  project_number       = local.project_number
  cluster_name         = var.cluster_name
  cluster_zone         = var.cluster_zone
}

module "containers" {
  source               = "./modules/containers"
  project_name         = var.project_name
  region               = var.region
  gke_service_account  = module.permissions.gke_service_account
  subnet_cidr          = var.subnet_cidr
  pods_cidr            = var.pods_cidr
  node_pool            = var.node_pool
  cluster_name         = var.cluster_name
  gke_version          = var.gke_version
  project_iam_bindings = module.permissions.iam_binding
}
