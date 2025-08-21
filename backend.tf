terraform {
  backend "gcs" {
    bucket = "statefile-bkt-tf"
    prefix = "terraform/state" # Optional prefix for the state file
  }
}
