moved {
  from = vcfa_shared_subnet.legacy_services
  to   = vcfa_shared_subnet.shared["legacy_services"]
}

resource "vcfa_shared_subnet" "shared" {
  for_each = var.shared_subnets

  name        = each.value.name
  description = each.value.description
  region_id   = data.vcfa_region.region.id

  subnet_type  = each.value.subnet_type
  gateway_cidr = each.value.gateway_cidr
  vlan_id      = each.value.vlan_id
}
