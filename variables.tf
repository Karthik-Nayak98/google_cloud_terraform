variable "project_name" {
  type        = string
  default     = "devops-gcp-tf"
  description = "Name of the GCP project"
}

variable "region" {
  type        = string
  default     = "us-central1"
  description = "Region for the project"
}

variable "github_repository" {
  type        = string
  description = "Name of the github repository to clone"
  default     = "frontend-backend-devops"
}

variable "github_repository_url" {
  type        = string
  description = "URL of the github repository to clone"
  default     = "https://github.com/Karthik-Nayak98/frontend-backend-devops.git"
}

variable "gitpat_secret" {
  type        = string
  description = "Token to authorize github repo with Google cloud"
  sensitive   = true
}

variable "app_installation_id" {
  type        = number
  description = "Id for the cloud build trigger app in github"
  default     = 81934858
}

variable "gcp_services" {
  type        = set(string)
  description = "List of services that needs to be enabled"
  default     = ["artifactregistry.googleapis.com", "storage.googleapis.com", "sourcerepo.googleapis.com", "appengine.googleapis.com", "cloudbuild.googleapis.com", "secretmanager.googleapis.com"]
}

# variable "cloudbuild_sa" {
#   type        = string
#   description = "Cloudbuild service account"
# }
