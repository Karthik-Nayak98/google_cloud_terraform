terraform {
  backend "gcs" {
    bucket = "demo-state-bucket-tf"
    prefix = "terraform/state" # Optional prefix for the state file
  }
}
