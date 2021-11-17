
output "project_id" {
    value = var.project_id
    description = "Google Cloud project ID "
}

output "webserver_ip" {
  value = google_compute_instance.web-vpc.network_interface.0.access_config.0.nat_ip
}