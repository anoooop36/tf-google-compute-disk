terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.10.0"
    }
  }
}

provider "google" {
  credentials = var.credentials
  project     = var.project
  region      = var.region
}

resource "google_compute_disk" "default" {
  name  = var.name
  type  = var.type
  zone  = var.zone
  image = var.image
  labels = {
    environment = "dev"
  }
  size = var.size
  physical_block_size_bytes = var.block_size
}

variable "type" {
  default = "pd-standard"
}

variable "name" {
  default = "test-disk-removeit"
}

variable "zone" {
  default = "us-central1-a"
}

variable "image" {
  default = "debian-11-bullseye-v20220719"
}

variable "size" {
  default = 20
}

variable "block_size" {
  default = 4096
}

variable "project" {}

variable "region" {
	default = "us-central1"
}

variable "credentials" {}
