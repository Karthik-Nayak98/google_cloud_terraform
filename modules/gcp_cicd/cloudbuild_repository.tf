
resource "google_cloudbuildv2_repository" "github_devops_repo" {
  project           = var.project_name
  location          = "us-central1"
  name              = var.github_repository
  parent_connection = google_cloudbuildv2_connection.github_repo_connection.id
  remote_uri        = var.github_repository_url
}
