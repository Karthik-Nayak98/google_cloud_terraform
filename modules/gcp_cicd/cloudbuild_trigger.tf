resource "google_cloudbuild_trigger" "ghe-trigger" {
  name     = "ghe-trigger"
  location = var.region
  project  = var.project_name

  repository_event_config {
    repository = google_cloudbuildv2_repository.github_devops_repo.id
    push {
      branch = "main"
    }
  }
  service_account = var.cloudbuild_sa

  filename = "cloudbuild.yaml"

  substitutions = {
    _PROJECT_ID  = var.project_name
    _PROJECT_NUMBER = var.project_number
    _REGION      = var.region
    _REPO_NAME   = google_cloudbuildv2_repository.github_devops_repo.name
    _IMAGE_NAME  = "frontend-backend"
    _ARTIFACTORY = google_artifact_registry_repository.frontend_backend_artifact.name
  }

  depends_on = [var.project_iam_bindings, google_cloudbuildv2_connection.github_repo_connection, google_artifact_registry_repository.frontend_backend_artifact]
}
