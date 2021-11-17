
variable "project_id" {
  description = "The GCP project to use for "
  type        = string
}

variable "subnetwork" {
  description = "The subnetwork selflink to host the compute instances in"
}

variable "network_tier" {
  description = "Network network_tier"
  default     = "PREMIUM"
}

