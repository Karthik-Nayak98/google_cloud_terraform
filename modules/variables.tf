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

variable "github_repository_url" {
  type        = string
  description = "URL of the github repository to clone"
}

variable "gitpat_secret" {
  type        = string
  description = "Token to authorize github repo with Google cloud"
  sensitive   = true
}

variable "gcp_services" {
  type        = set(string)
  description = "List of services that needs to be enabled"
}

