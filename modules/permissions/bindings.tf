module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google/modules/projects_iam"
  version = ">= 6.4"

  projects = [var.project_name]
  mode     = "authoritative"

  bindings = {
    "roles/cloudbuild.builds.editor" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}"
    ]
  }

  depends_on = [google_service_account.cloudbuild_service_account]
}
