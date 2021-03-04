variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_container_cluster" "primary" {

  name     = "${var.project_id}-gke"
  location = var.region

  logging_service = "none"
  monitoring_service = "none"

  min_master_version = "1.19.7-gke.1500"
  node_version = "1.19.7-gke.1500"

  initial_node_count = 1
  node_config {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    disk_size_gb      = 20
    machine_type      = "e2-small"
  }

  release_channel {
    channel = "RAPID"
  }
}  
