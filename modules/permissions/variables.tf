variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "region" {
  type        = string
  description = "Region of the project"
}

variable "gcp_services" {
  type        = set(string)
  description = "List of services that needs to be enabled"
}





