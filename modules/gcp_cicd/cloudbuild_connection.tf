resource "google_secret_manager_secret" "github_token_secret" {
  project   = var.project_name
  secret_id = "github-token-secret"

  replication {
    auto {}
  }
  depends_on = [var.gcp_enabled_apis]
}

resource "google_secret_manager_secret_version" "github_token_secret_version" {
  secret      = google_secret_manager_secret.github_token_secret.id
  secret_data = var.gitpat_secret
}

# data "google_iam_policy" "p4sa-secretAccessor" {
#   binding {
#     role = "roles/secretmanager.secretAccessor"
#     // Here, 123456789 is the Google Cloud project number for the project that contains the connection.
#     members = ["serviceAccount:service-123456789@gcp-sa-cloudbuild.iam.gserviceaccount.com"]
#   }
# }

# resource "google_secret_manager_secret_iam_policy" "policy" {
#   secret_id   = google_secret_manager_secret.github-token-secret.secret_id
#   policy_data = data.google_iam_policy.p4sa-secretAccessor.policy_data
# }

resource "google_cloudbuildv2_connection" "github_repo_connection" {
  project  = var.project_name
  location = var.region
  name     = "github-connection-gen2"

  github_config {
    app_installation_id = var.app_installation_id
    authorizer_credential {
      oauth_token_secret_version = google_secret_manager_secret_version.github_token_secret_version.id
    }
  }

  depends_on = [var.project_iam_bindings]
}
