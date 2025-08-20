
resource "google_cloudbuildv2_repository" "my-repository" {
  project           = var.project_name
  location          = "us-central1"
  name              = var.github_repository
  parent_connection = google_cloudbuildv2_connection.github_repo_connection
  remote_uri        = var.github_repository_url
}
