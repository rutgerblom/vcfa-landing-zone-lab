resource "vcfa_org_oidc" "lz" {
  org_id                 = vcfa_org.lz.id
  enabled                = var.oidc_enabled
  prefer_id_token        = false
  client_id              = var.oidc_client_id
  client_secret          = var.oidc_client_secret
  max_clock_skew_seconds = 60

  wellknown_endpoint = var.oidc_wellknown_endpoint

  claims_mapping {
    email      = "email"
    subject    = "sub"
    first_name = "given_name"
    last_name  = "family_name"
    full_name  = "name"
    groups     = "groups"
  }
}
