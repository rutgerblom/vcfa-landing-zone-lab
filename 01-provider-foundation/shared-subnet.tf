resource "vcfa_shared_subnet" "legacy_services" {
  name        = "legacy-services-vlan-123"
  description = "Shared VLAN subnet for legacy service connectivity"
  region_id   = data.vcfa_region.region.id

  subnet_type  = "VLAN"
  gateway_cidr = "10.123.0.1/24"
  vlan_id      = 123
}
