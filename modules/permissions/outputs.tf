output "gcp_enabled_apis" {
  description = "The status of each enabled GCP API."
  value       = google_project_service.gcp_services
}
