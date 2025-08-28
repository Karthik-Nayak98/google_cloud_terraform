resource "google_secret_manager_secret" "github_token_secret" {
  project   = var.project_name
  secret_id = "github-token-secret"

  replication {
    auto {}
  }
  depends_on = [var.gcp_enabled_apis]
}

resource "google_secret_manager_secret_version" "github_token_secret_version" {
  provider    = google-beta
  secret      = google_secret_manager_secret.github_token_secret.id
  secret_data = var.gitpat_secret
  depends_on  = [google_secret_manager_secret.github_token_secret]
}

# Define the IAM policy to allow Cloud Build's service account to access the secret
data "google_iam_policy" "p4sa-secretAccessor" {
  binding {
    role    = "roles/secretmanager.secretAccessor"
    members = ["serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"]
  }
}

# Attach the policy to the secret
resource "google_secret_manager_secret_iam_policy" "policy" {
  project     = google_secret_manager_secret.github_token_secret.project
  secret_id   = google_secret_manager_secret.github_token_secret.id
  policy_data = data.google_iam_policy.p4sa-secretAccessor.policy_data
}

resource "google_cloudbuildv2_connection" "github_repo_connection" {
  provider = google-beta
  project  = var.project_name
  location = var.region
  name     = "github-connection-gen2"

  github_config {
    # The GitHub App installation ID, obtained from your GitHub App settings.
    # This value is required to authenticate the Cloud Build connection to your GitHub repository.
    app_installation_id = var.app_installation_id
    # authorizer_credential {
    #   oauth_token_secret_version = google_secret_manager_secret_version.github_token_secret_version.id
    # }
  }

  depends_on = [var.project_iam_bindings, google_secret_manager_secret_iam_policy.policy]
}
