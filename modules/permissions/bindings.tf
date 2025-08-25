module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [var.project_name]
  mode     = "authoritative"

  bindings = {
    "roles/cloudbuild.connectionAdmin" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
    ],
    "roles/secretmanager.secretAccessor" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
      "serviceAccount:service-${google_project.gcp-project.number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
    ]
  }

  depends_on = [google_service_account.cloudbuild_service_account]
}
