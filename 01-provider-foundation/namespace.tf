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

  name_prefix  = "payments-dev"
  project_name = "default-project"
  class_name   = "small"
  description  = "Payments development namespace"

  region_name = data.vcfa_region.region.name
  vpc_name    = "default-eu-north-1"

  storage_classes_class_config_overrides {
    name  = var.storage_policy_name
    limit = "100Gi"
  }

  zones_class_config_overrides {
    name               = var.region_zone_name
    cpu_limit          = "4000M"
    cpu_reservation    = "0M"
    memory_limit       = "8192Mi"
    memory_reservation = "0Mi"
  }
}