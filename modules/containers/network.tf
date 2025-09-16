resource "google_compute_network" "gke_network" {
  project                 = var.project_name
  name                    = "gke-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "gke_subnet" {
  name          = "gke-subnet"
  project       = var.project_name
  region        = var.region
  network       = google_compute_network.gke_network.id
  ip_cidr_range = var.subnet_cidr

  #  CIDR range for GKE pods
  secondary_ip_range {
    range_name    = "pods"
    ip_cidr_range = var.pods_cidr
  }

  # CIDR range for GKE services
  secondary_ip_range {
    range_name    = "services"
    ip_cidr_range = var.services_cidr
  }
}

# Firewalls rules for GKE 

# 1. Allow internal communication between nodes
resource "google_compute_firewall" "internal_firewall" {
  name    = "${var.cluster_name}-internal-firewall"
  network = google_compute_network.gke_network.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  source_ranges = [
    var.subnet_cidr,
    var.pods_cidr,
    var.services_cidr,
  ]

  direction = "INGRESS"

  depends_on = [var.project_iam_bindings]
}

# 2. Allow SSH for debugging (optional but recommended)
resource "google_compute_firewall" "allow_ssh" {
  name    = "${var.cluster_name}-allow-ssh"
  network = google_compute_network.gke_network.name
  project = var.project_name

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"] # Restrict this to your IP in production

  direction = "INGRESS"

  depends_on = [var.project_iam_bindings]
}

# 3. Allow HTTP/HTTPS traffic (for web applications)
resource "google_compute_firewall" "allow_web" {
  name    = "${var.cluster_name}-allow-web"
  network = google_compute_network.gke_network.name
  project = var.project_name

  allow {
    protocol = "tcp"
    ports    = ["80", "443", "10250"] # 10250 is for Kubelet API
  }

  source_ranges = ["0.0.0.0/0"]

  direction = "INGRESS"

  depends_on = [var.project_iam_bindings]
}



# 4. Allow GKE health checks (important for load balancers)
resource "google_compute_firewall" "gke_health_checks" {
  name        = "${var.cluster_name}-allow-health-checks"
  network     = google_compute_network.gke_network.name
  description = "Allow GKE health checks from Google's load balancer ranges"

  allow {
    protocol = "tcp"
    ports    = ["3000", "80", "443"] # Include your app port (3000)
  }

  # GCP health check ranges - CRITICAL for load balancers
  source_ranges = [
    "130.211.0.0/22",
    "35.191.0.0/16",
    "209.85.152.0/22",
    "209.85.204.0/22"
  ]

  direction = "INGRESS"
}