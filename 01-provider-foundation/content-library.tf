data "vcfa_storage_class" "content_storage" {
  region_id = data.vcfa_region.region.id
  name      = var.storage_policy_name
}

resource "vcfa_content_library" "tenant_blue" {
  org_id           = vcfa_org.lz.id
  name             = "${var.org_name}-library"
  description      = "${var.org_display_name} content library"
  auto_attach      = false
  delete_recursive = true

  storage_class_ids = [
    data.vcfa_storage_class.content_storage.id
  ]

  depends_on = [
    vcfa_org_region_quota.lz
  ]
}
