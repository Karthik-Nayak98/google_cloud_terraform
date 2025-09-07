
resource "google_cloudbuildv2_repository" "github_devops_repo" {
  project           = var.project_name
  location          = var.region
  name              = var.github_repository
  parent_connection = google_cloudbuildv2_connection.github_repo_connection.id
  remote_uri        = "https://github.com/${var.github_owner}/${var.github_repository}.git"
}
