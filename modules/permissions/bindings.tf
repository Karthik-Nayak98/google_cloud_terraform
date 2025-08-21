resource "google_project_iam_member" "cloudbuild_editor" {
  project = var.project_name
  role    = "roles/cloudbuild.builds.editor"
  member  = "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
}
