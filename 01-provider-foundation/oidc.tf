resource "vcfa_org_oidc" "lz" {
  org_id                 = vcfa_org.lz.id
  enabled                = var.oidc_enabled
  prefer_id_token        = var.oidc_prefer_id_token
  client_id              = var.oidc_client_id
  client_secret          = var.oidc_client_secret
  max_clock_skew_seconds = var.oidc_max_clock_skew_seconds

  wellknown_endpoint = var.oidc_wellknown_endpoint

  claims_mapping {
    email      = var.oidc_claims_mapping.email
    subject    = var.oidc_claims_mapping.subject
    first_name = var.oidc_claims_mapping.first_name
    last_name  = var.oidc_claims_mapping.last_name
    full_name  = var.oidc_claims_mapping.full_name
    groups     = var.oidc_claims_mapping.groups
  }
}
