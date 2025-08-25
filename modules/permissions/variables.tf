variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "region" {
  type        = string
  description = "Region of the project"
}

variable "gcp_services" {
  type        = list(string)
  description = "List of services that needs to be enabled"
}

variable "project_number" {
  type        = string
  description = "The project number of the GCP project"
}


variable "terraform_service_account" {
  type        = string
  description = "Service account email to run terraform"
}



