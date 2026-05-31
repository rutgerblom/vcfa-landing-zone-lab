provider "vcfa" {
  url                  = var.vcfa_url
  org                  = "System"
  auth_type            = "integrated"
  user                 = var.vcfa_user
  password             = var.vcfa_password
  allow_unverified_ssl = var.allow_unverified_ssl
}
