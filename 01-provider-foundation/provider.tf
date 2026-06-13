provider "vcfa" {
  url                  = var.vcfa_url
  org                  = "System"
  auth_type            = "integrated"
  user                 = var.vcfa_user
  password             = var.vcfa_password
  allow_unverified_ssl = var.allow_unverified_ssl
}

provider "vcfa" {
  alias                = "tenant_blue"
  url                  = var.vcfa_url
  org                  = var.org_name
  auth_type            = "integrated"
  user                 = var.tenant_admin_username
  password             = var.tenant_admin_password
  allow_unverified_ssl = var.allow_unverified_ssl
}
