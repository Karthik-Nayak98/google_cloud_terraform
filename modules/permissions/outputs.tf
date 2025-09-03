output "gcp_enabled_apis" {
  description = "The status of each enabled GCP API."
  value       = google_project_service.project_services
}

output "iam_binding" {
  description = "IAM bindings applied to the project."
  value       = module.projects_iam_bindings
}


output "cloudbuild_sa" {
  description = "Service account for the cloud build"
  value       = google_service_account.cloudbuild_service_account.email
}
