data "vcfa_role" "org_admin" {
  org_id = vcfa_org.lz.id
  name   = var.tenant_admin_role_name
}

resource "vcfa_org_local_user" "tenant_admin" {
  org_id   = vcfa_org.lz.id
  username = var.tenant_admin_username
  password = var.tenant_admin_password

  role_ids = [
    data.vcfa_role.org_admin.id
  ]
}
