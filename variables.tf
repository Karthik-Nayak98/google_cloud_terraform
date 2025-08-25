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

variable "github_owner" {
  type        = string
  description = "Owner of the github repository"
  default     = ""
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

variable "terraform_service_account" {
  type        = string
  description = "Service account email to run terraform"
}
variable "app_installation_id" {
  type        = number
  description = "Id for the cloud build trigger app in github"
  default     = 81934858
}

variable "gcp_services" {
  type        = list(string)
  description = "List of services that needs to be enabled"
  default = [
    "serviceusage.googleapis.com",
    "cloudapis.googleapis.com",
    "storage.googleapis.com",
    "artifactregistry.googleapis.com",
    "cloudbuild.googleapis.com",
    "appengine.googleapis.com",
  "secretmanager.googleapis.com"]
}

# variable "cloudbuild_sa" {
#   type        = string
#   description = "Cloudbuild service account"
# }
