provider "google" {
  version = "1.4.0"
  project = "${var.project}"
  region  = "${var.region}"
}

resource "google_compute_instance_template" "tpl" {
  name = "template"
  machine_type = "g1-small"
  tags               = ["reddit"]

  disk {
    source_image = "${var.disk_image}"
    auto_delete  = true
    boot         = true
  }

  metadata {
    ssh-keys = "test:${file(var.public_key_path)}"
  }

  network_interface {
    network = "default"
    access_config = {}
  }
}

resource "google_compute_address" "app_ip" {
  name = "reddit-app-ip"
}

resource "google_compute_instance_group_manager" "appserver" {
  name = "appserver-igm"
  zone               = "${var.zone}"

  base_instance_name = "reddit"
  instance_template  = "${google_compute_instance_template.tpl.self_link}"
  update_strategy    = "NONE"
  target_size        = "${var.instance_count}"
}

resource "google_compute_firewall" "firewall_puma" {
  name    = "allow-puma-default"
  network = "default"

  allow {
    protocol = "tcp"

    ports = ["9292"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["reddit"]
}
