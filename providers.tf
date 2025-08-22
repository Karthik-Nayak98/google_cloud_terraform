terraform {
  required_providers {
    google = {
      version = "~> 6.49.0"
    }
    google-beta = {
      version = "~> 6.49.0"
    }
  }
}
provider "google" {
  project = var.project_name
  region  = var.region
}

provider "google-beta" {
  project = var.project_name
  region  = var.region
}
