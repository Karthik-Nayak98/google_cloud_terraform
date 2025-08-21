output "gcp_enabled_apis" {
  description = "The status of each enabled GCP API."
  value       = google_project_service.gcp_services
}


output "cloudbuild_sa" {
  description = "Service account for the cloud build"
  value       = google_service_account.cloudbuild_service_account.name
}
