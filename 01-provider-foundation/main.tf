resource "vcfa_org" "lz" {
  name         = var.org_name
  display_name = var.org_display_name
  description  = var.org_description
  is_enabled   = var.org_enabled
}

resource "vcfa_org_region_quota" "lz" {
  org_id         = vcfa_org.lz.id
  region_id      = data.vcfa_region.region.id
  supervisor_ids = [data.vcfa_supervisor.supervisor.id]

  zone_resource_allocations {
    region_zone_id         = data.vcfa_region_zone.zone.id
    cpu_limit_mhz          = var.org_quota.cpu_limit_mhz
    cpu_reservation_mhz    = var.org_quota.cpu_reservation_mhz
    memory_limit_mib       = var.org_quota.memory_limit_mib
    memory_reservation_mib = var.org_quota.memory_reservation_mib
  }

  region_vm_class_ids = [
    data.vcfa_region_vm_class.vm_class.id
  ]

  region_storage_policy {
    region_storage_policy_id = data.vcfa_region_storage_policy.storage_policy.id
    storage_limit_mib        = var.org_quota.storage_limit_mib
  }
}

resource "vcfa_org_networking" "lz" {
  org_id   = vcfa_org.lz.id
  log_name = var.networking_log_name
}

resource "vcfa_org_regional_networking" "lz" {
  name                = local.regional_networking_name
  org_id              = vcfa_org_networking.lz.id
  region_id           = data.vcfa_region.region.id
  provider_gateway_id = data.vcfa_provider_gateway.provider_gateway.id
  edge_cluster_id     = data.vcfa_edge_cluster.edge_cluster.id
}
