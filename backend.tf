terraform {
backend "gcs" {
  bucket = "gcpfoundationstate"   # GCS bucket name to store terraform tfstate
  prefix = "compute"           # Update to desired prefix name. Prefix name should be unique for each Terraform project having same remote state bucket.
  }
}