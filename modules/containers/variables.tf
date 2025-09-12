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

variable "gke_service_account" {
  type        = string
  description = "Service account for GKE node pool"
}

variable "subnet_cidr" {
  description = "value of the subnet cidr"
  type        = string
  default     = "10.10.0.0/24"
}

variable "pods_cidr" {
  description = "value of the pods cidr"
  type        = string
  default     = "10.10.1.0/24"
}

variable "services_cidr" {
  description = "value of the services cidr"
  type        = string
  default     = "10.10.2.0/24"
}


variable "cluster_name" {
  type        = string
  default     = "gke-standard-cluster"
  description = "Name of the GKE cluster"
}

variable "node_pool" {
  type        = string
  default     = "gke-node-pool"
  description = "Name of the GKE node pool"
}

variable "gke_version" {
  type        = string
  default     = "1.33.3-gke.1136000"
  description = "Version of GKE cluster"
}