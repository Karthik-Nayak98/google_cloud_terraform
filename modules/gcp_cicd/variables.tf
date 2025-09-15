variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "region" {
  type        = string
  description = "Region of the project"
}

variable "github_repository" {
  type        = string
  description = "Name of the github repository to clone"
}

variable "github_owner" {
  type        = string
  description = "Owner of the github repository"
  default     = "Karthik-Nayak98"
}


variable "gitpat_secret" {
  type        = string
  description = "Token to authorize github repo with Google cloud"
  sensitive   = true
}

variable "app_installation_id" {
  type        = string
  description = "Id for the cloud build trigger app in github"
}

variable "gcp_enabled_apis" {
  type        = any
  description = "List of enabled GCP APIs"
}

variable "cloudbuild_sa" {
  type        = string
  description = "Cloud build service account"
}

variable "project_iam_bindings" {
  type        = any
  description = "IAM bindings applied to the project"
}

variable "project_number" {
  type        = string
  description = "The project number of the GCP project"
}
variable "cluster_name" {
  type        = string
  default     = "gke-standard-cluster"
  description = "Name of the GKE cluster"
}

variable "cluster_zone" {
  type        = string
  description = "Zone for the GKE cluster"
  default     = "us-central1-f"
}