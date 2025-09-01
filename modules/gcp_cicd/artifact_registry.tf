resource "google_artifact_registry_repository" "frontend_backend_artifact" {
  location      = var.region
  repository_id = "frontend_backend_repo"
  description   = "Registry for storing the frontend and backend images"
  format        = "DOCKER"
}