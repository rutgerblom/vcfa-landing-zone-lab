data "vcfa_vcenter" "vc" {
  name = var.vcenter_name
}

data "vcfa_supervisor" "supervisor" {
  name       = var.supervisor_name
  vcenter_id = data.vcfa_vcenter.vc.id
}

data "vcfa_region" "region" {
  name = var.region_name
}

data "vcfa_region_zone" "zone" {
  region_id = data.vcfa_region.region.id
  name      = var.region_zone_name
}

data "vcfa_region_vm_class" "vm_class" {
  region_id = data.vcfa_region.region.id
  name      = var.vm_class_name
}

data "vcfa_region_storage_policy" "storage_policy" {
  region_id = data.vcfa_region.region.id
  name      = var.storage_policy_name
}

data "vcfa_provider_gateway" "provider_gateway" {
  name      = var.provider_gateway_name
  region_id = data.vcfa_region.region.id
}

data "vcfa_edge_cluster" "edge_cluster" {
  name      = var.edge_cluster_name
  region_id = data.vcfa_region.region.id
}
