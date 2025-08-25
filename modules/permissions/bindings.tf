module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [var.project_name]
  mode     = "authoritative"

  bindings = {
    "roles/cloudbuild.connection" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
    ],
    "roles/secretmanager.secretAccessor" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
    ]
  }

  depends_on = [google_service_account.cloudbuild_service_account]
}
