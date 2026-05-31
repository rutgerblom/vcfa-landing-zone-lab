output "org_id" {
  value = vcfa_org.lz.id
}

output "org_name" {
  value = vcfa_org.lz.name
}

output "region_id" {
  value = data.vcfa_region.region.id
}

output "supervisor_id" {
  value = data.vcfa_supervisor.supervisor.id
}

output "provider_gateway_id" {
  value = data.vcfa_provider_gateway.provider_gateway.id
}

output "edge_cluster_id" {
  value = data.vcfa_edge_cluster.edge_cluster.id
}
