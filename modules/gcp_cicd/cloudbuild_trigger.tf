resource "google_cloudbuild_trigger" "ghe-trigger" {
  name     = "ghe-trigger"
  location = var.region
  project  = var.project_name


  github {
    owner = var.github_owner
    name  = var.github_repository
    push {
      branch = "^main$"
    }
  }
  service_account = var.cloudbuild_sa

  filename = "cloudbuild.yaml"
}
