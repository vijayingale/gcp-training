# [START compute_vm_with_webserver]

resource "google_compute_instance" "web-vpc" {        # Specify the VPC name 
  name         = "virtual-machine-from-terraform"
  machine_type = "f1-micro"
  zone         = "us-west1-a"                         # Subnet Zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
        subnetwork = var.subnetwork # Replace with self link to a subnetwork in quotes
    
    access_config {
      // Include this section to give the VM an external ip address
    }
  }

    metadata_startup_script = "sudo apt-get update && sudo apt-get install apache2 -y && echo '<!doctype html><html><body><h1>Welcome to the demo!</h1></body></html>' | sudo tee /var/www/html/index.html"

    // Apply the firewall rule to allow external IPs to access this instance
    tags = ["http-server"]
}

resource "google_compute_firewall" "http-server" {
  name    = "default-allow-http-terraform"
  network = "web-vpc"

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  // Allow traffic from everywhere to instances with an http-server tag
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["http-server"]
}
# [END compute_vm_with_webserver]
