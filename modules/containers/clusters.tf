resource "google_container_cluster" "gke_cluster" {
  name     = var.cluster_name
  location = var.region


  network             = google_compute_network.gke_network.id
  subnetwork          = google_compute_subnetwork.gke_subnet.id
  min_master_version  = var.gke_version
  deletion_protection = false

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 2 # Create a 2 node cluster

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = var.pods_cidr
    services_ipv4_cidr_block = var.services_cidr
  }

  # Ensures no default SA is used
  node_config {
    service_account = var.gke_service_account
  }

  depends_on = [google_compute_firewall.internal_firewall, google_compute_firewall.allow_ssh]
}

resource "google_container_node_pool" "gke_node_pool" {
  name       = var.node_pool
  location   = var.region
  project    = var.project_name
  cluster    = google_container_cluster.gke_cluster.name
  version    = var.gke_version
  node_count = 1

  node_config {
    image_type   = "UBUNTU_CONTAINERD"
    machine_type = "e2-medium"
    disk_size_gb = "20"
    disk_type    = "pd-standard"

    service_account = var.gke_service_account
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform" # Scope for full access to all Cloud APIs, but without IAM for the Service Account its useless.
    ]
  }
  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  depends_on = [var.gke_service_account, google_container_cluster.gke_cluster]
}