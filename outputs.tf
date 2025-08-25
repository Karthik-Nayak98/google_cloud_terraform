data "google_project" "project" {}

output "project_number" {
  value       = data.google_project.project.number
  description = "The project number of the GCP project"
}