data "vcfa_storage_class" "content_storage" {
  region_id = data.vcfa_region.region.id
  name      = var.storage_policy_name
}

resource "vcfa_content_library" "tenant_blue" {
  org_id           = vcfa_org.lz.id
  name             = local.content_library_name
  description      = local.content_library_description
  auto_attach      = var.content_library_auto_attach
  delete_recursive = var.content_library_delete_recursive

  storage_class_ids = [
    data.vcfa_storage_class.content_storage.id
  ]

  depends_on = [
    vcfa_org_region_quota.lz
  ]
}
