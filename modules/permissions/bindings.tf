module "projects_iam_bindings" {
  source  = "terraform-google-modules/iam/google//modules/projects_iam"
  version = "~> 8.0"

  projects = [var.project_name]
  mode     = "authoritative"

  bindings = {
    "roles/cloudbuild.connectionAdmin" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
      "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
      "serviceAccount:${var.terraform_service_account}",
    ],
    "roles/cloudbuild.builds.editor" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
      "serviceAccount:${var.terraform_service_account}",
      "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
    ],
    "roles/cloudbuild.builds.builder" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
      "serviceAccount:${var.terraform_service_account}",
    ],
    "roles/cloudbuild.serviceAgent" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
      "serviceAccount:${var.terraform_service_account}",
      "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
    ]
    "roles/secretmanager.secretAccessor" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
      "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
      "serviceAccount:service-${var.project_number}@gcp-sa-devconnect.iam.gserviceaccount.com"
    ],
    "roles/developerconnect.admin" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
      "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
      "serviceAccount:${var.terraform_service_account}",
    ],
    "roles/iam.serviceAccountUser" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
      "serviceAccount:${var.terraform_service_account}",
      "serviceAccount:service-${var.project_number}@gcp-sa-devconnect.iam.gserviceaccount.com"
    ],
    "roles/container.admin" = [
      "serviceAccount:${var.terraform_service_account}",
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
    ],
    "roles/compute.networkAdmin" = [
      "serviceAccount:${var.terraform_service_account}",
    ],
    "roles/iam.serviceAccountUser" = [
      "serviceAccount:${var.terraform_service_account}",
    ],
    "roles/artifactregistry.admin" = [
      "serviceAccount:${var.terraform_service_account}",
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
    ],
    "roles/artifactregistry.reader" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
    ],
    "roles/logging.logWriter" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
    ],
    "roles/serviceusage.serviceUsageConsumer" = [
      "serviceAccount:${google_service_account.cloudbuild_service_account.email}",
      "serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com",
    ]
  }

  depends_on = [google_service_account.cloudbuild_service_account]
}