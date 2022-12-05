# ok: gcp-compute-firewall-unrestricted-ingress-22
resource "google_compute_firewall" "restricted" {
  name    = "example"
  network = "google_compute_network.vpc.name"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["172.1.2.3/32"]
  target_tags   = ["ssh"]
}

# ok: gcp-compute-firewall-unrestricted-ingress-22
resource "google_compute_firewall" "allow_different_int" {
  name    = "example"
  network = "google_compute_network.vpc.name"

  allow {
    protocol = "tcp"
    ports    = [4624]
  }

  source_ranges = ["172.1.2.3/32"]
  target_tags   = ["ssh"]
}

# ok: gcp-compute-firewall-unrestricted-ingress-22
resource "google_compute_firewall" "allow_null" {
  name    = "example"
  network = "google_compute_network.vpc.name"

  allow {
    protocol = "tcp"
    ports    = null
  }

  source_ranges = ["172.1.2.3/32"]
  target_tags   = ["ssh"]
}

# fail
# ruleid: gcp-compute-firewall-unrestricted-ingress-22
resource "google_compute_firewall" "allow_ssh_int" {
  name    = "example"
  network = "google_compute_network.vpc.name"

  allow {
    protocol = "tcp"
    ports    = [22]
  }

  source_ranges = ["0.0.0.0/0"]
}

# fail
# ruleid: gcp-compute-firewall-unrestricted-ingress-22
resource "google_compute_firewall" "allow_multiple" {
  name    = "example"
  network = "google_compute_network.vpc.name"

  allow {
    protocol = "tcp"
    ports    = ["1024-65535", "22"]
  }

  source_ranges = ["0.0.0.0/0"]
}