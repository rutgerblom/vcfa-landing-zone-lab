data "vcfa_kubeconfig" "org" {
  provider = vcfa.tenant_blue
}

provider "kubernetes" {
  host     = data.vcfa_kubeconfig.org.host
  token    = data.vcfa_kubeconfig.org.token
  insecure = data.vcfa_kubeconfig.org.insecure_skip_tls_verify
}

resource "vcfa_supervisor_namespace" "payments_dev" {
  provider = vcfa.tenant_blue

  name_prefix  = var.supervisor_namespace.name_prefix
  project_name = var.project_name
  class_name   = var.supervisor_namespace.class_name
  description  = var.supervisor_namespace.description

  region_name = data.vcfa_region.region.name
  vpc_name    = local.namespace_vpc_name

  storage_classes_class_config_overrides {
    name  = var.storage_policy_name
    limit = var.supervisor_namespace.storage_limit
  }

  zones_class_config_overrides {
    name               = var.region_zone_name
    cpu_limit          = var.supervisor_namespace.cpu_limit
    cpu_reservation    = var.supervisor_namespace.cpu_reservation
    memory_limit       = var.supervisor_namespace.memory_limit
    memory_reservation = var.supervisor_namespace.memory_reservation
  }
}
