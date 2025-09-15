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
  default     = "10.51.0.0/20"
}

variable "pods_cidr" {
  description = "value of the pods cidr"
  type        = string
  default     = "10.53.0.0/20"
}

variable "services_cidr" {
  description = "value of the services cidr"
  type        = string
  default     = "10.52.0.0/20"
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

variable "project_iam_bindings" {
  type        = any
  description = "IAM bindings applied to the project"
}
