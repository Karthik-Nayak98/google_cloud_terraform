resource "google_secret_manager_secret" "github-token-secret" {
  project   = var.project_name
  secret_id = "github-token-secret"
  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "github-token-secret-version" {
  provider    = google-beta
  secret      = google_secret_manager_secret.github-token-secret.id
  secret_data = var.gitpat_secret
  depends_on = [google_secret_manager_secret.github-token-secret]
}

data "google_iam_policy" "p4sa-secretAccessor" {
  binding {
    role = "roles/secretmanager.secretAccessor"
    members = ["serviceAccount:service-${var.project_number}@gcp-sa-cloudbuild.iam.gserviceaccount.com"]
  }
}

resource "google_secret_manager_secret_iam_policy" "policy" {
  secret_id = google_secret_manager_secret.github-token-secret.secret_id
  policy_data = data.google_iam_policy.p4sa-secretAccessor.policy_data
}

resource "google_cloudbuildv2_connection" "github_repo_connection" {
  provider = google-beta
  project  = var.project_name
  location = var.region
  name     = "github-connection-gen2"

  github_config {
    app_installation_id = "${var.app_installation_id}"
    authorizer_credential {
      oauth_token_secret_version = google_secret_manager_secret_version.github-token-secret-version.id
    }
  }

  depends_on = [var.project_iam_bindings, google_secret_manager_secret_version.github-token-secret-version]
}