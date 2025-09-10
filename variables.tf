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
  default     = "Karthik-Nayak98"
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
  type        = string
  description = "Id for the cloud build trigger app in github"
  default     = "83982120"
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
    "developerconnect.googleapis.com",
    "appengine.googleapis.com",
    "container.googleapis.com",
    "secretmanager.googleapis.com",
    "compute.googleapis.com"
  ]
}

variable "subnet_cidr" {
  description = "value of the subnet cidr"
  type        = string
}

variable "pods_cidr" {
  description = "value of the pods cidr"
  type        = string
}

variable "services_cidr" {
  description = "value of the services cidr"
  type        = string
}

variable "cluster_name" {
  type        = string
  description = "Name of the GKE cluster"
}

variable "node_pool" {
  type        = string
  description = "Name of the GKE node pool"
}

variable "gke_version" {
  type        = string
  description = "Version of GKE cluster"
}