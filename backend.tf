terraform {
  backend "gcs" {
    bucket = "demo-bucket"
    prefix = "terraform/state" # Optional prefix for the state file
  }
}
