resource "google_artifact_registry_repository" "frontend_backend_artifact" {
  project       = var.project_name
  location      = var.region
  repository_id = "frontend-backend-repo"
  description   = "Registry for storing the frontend and backend images"
  format        = "DOCKER"
}