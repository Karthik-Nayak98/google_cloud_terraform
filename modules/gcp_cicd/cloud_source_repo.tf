resource "google_sourcerepo_repository" "frontend_backend_repo" {
  name       = "frontend-backend-devops"
  project    = var.project_name
  depends_on = [module.gcp_service]
}
