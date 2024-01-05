terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {
  project     = "latest-project-410306"
  region      = "us-central1"
}

resource "google_storage_bucket" "pratice_bucket" {
  name          = "latest-project-410306_data_talk_bucket"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}