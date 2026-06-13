variable "vcfa_url" {
  type        = string
  description = "VCF Automation URL, for example https://pod-240-auto.sddc.lab"
}

variable "vcfa_user" {
  type        = string
  description = "VCF Automation username"
  sensitive   = true
}

variable "vcfa_password" {
  type        = string
  description = "VCF Automation password"
  sensitive   = true
}

variable "allow_unverified_ssl" {
  type        = bool
  description = "Allow unverified TLS certificates"
  default     = true
}

variable "vcenter_name" {
  type        = string
  description = "vCenter name as known to VCFA"
}

variable "supervisor_name" {
  type        = string
  description = "Supervisor name as known to VCFA"
}

variable "region_name" {
  type        = string
  description = "VCFA region name"
}

variable "region_zone_name" {
  type        = string
  description = "VCFA region zone name"
}

variable "provider_gateway_name" {
  type        = string
  description = "Existing VCFA provider gateway name"
}

variable "edge_cluster_name" {
  type        = string
  description = "Existing VCFA edge cluster name"
}

variable "vm_class_name" {
  type        = string
  description = "VM class to expose to the organization"
  default     = "best-effort-small"
}

variable "storage_policy_name" {
  type        = string
  description = "Storage policy to expose to the organization"
}

variable "org_name" {
  type        = string
  description = "Short organization name"
  default     = "lz-blue"
}

variable "org_display_name" {
  type        = string
  description = "Organization display name"
  default     = "Landing Zone Blue"
}

variable "org_description" {
  type        = string
  description = "Organization description"
  default     = "Terraform lab organization for VCF Automation All Apps landing zone validation"
}

variable "org_enabled" {
  type        = bool
  description = "Enable the organization"
  default     = true
}

variable "org_quota" {
  type = object({
    cpu_limit_mhz          = number
    cpu_reservation_mhz    = number
    memory_limit_mib       = number
    memory_reservation_mib = number
    storage_limit_mib      = number
  })
  description = "Regional compute and storage quota assigned to the organization"
  default = {
    cpu_limit_mhz          = 20000
    cpu_reservation_mhz    = 0
    memory_limit_mib       = 65536
    memory_reservation_mib = 0
    storage_limit_mib      = 524288
  }
}

variable "networking_log_name" {
  type        = string
  description = "Organization networking log name"
  default     = "tnblue"
}

variable "regional_networking_name" {
  type        = string
  description = "Regional networking name. Defaults to org_name plus region_name when null."
  default     = null
}

variable "oidc_enabled" {
  type        = bool
  description = "Enable OIDC for the organization"
  default     = true
}

variable "oidc_prefer_id_token" {
  type        = bool
  description = "Prefer OIDC ID token claims"
  default     = false
}

variable "oidc_max_clock_skew_seconds" {
  type        = number
  description = "Maximum allowed OIDC clock skew in seconds"
  default     = 60
}

variable "oidc_client_id" {
  type        = string
  description = "OIDC client ID"
  sensitive   = true
}

variable "oidc_client_secret" {
  type        = string
  description = "OIDC client secret"
  sensitive   = true
}

variable "oidc_wellknown_endpoint" {
  type        = string
  description = "OIDC well-known endpoint"
}

variable "oidc_claims_mapping" {
  type = object({
    email      = string
    subject    = string
    first_name = string
    last_name  = string
    full_name  = string
    groups     = string
  })
  description = "OIDC claims mapping for organization users"
  default = {
    email      = "email"
    subject    = "sub"
    first_name = "given_name"
    last_name  = "family_name"
    full_name  = "name"
    groups     = "groups"
  }
}

variable "tenant_admin_username" {
  type        = string
  description = "Username for the initial local organization administrator"
  default     = "tenant-admin"
}

variable "tenant_admin_password" {
  type        = string
  description = "Password for the initial local organization administrator"
  sensitive   = true
}

variable "tenant_admin_role_name" {
  type        = string
  description = "Organization role assigned to the initial local administrator"
  default     = "Organization Administrator"
}

variable "project_name" {
  type        = string
  description = "VCF Automation project used for the Supervisor Namespace"
  default     = "default-project"
}

variable "vpc_name" {
  type        = string
  description = "VCF Automation VPC used for the Supervisor Namespace"
  default     = null
}

variable "supervisor_namespace" {
  type = object({
    name_prefix        = string
    class_name         = string
    description        = string
    storage_limit      = string
    cpu_limit          = string
    cpu_reservation    = string
    memory_limit       = string
    memory_reservation = string
  })
  description = "Supervisor Namespace identity, class, and resource overrides"
  default = {
    name_prefix        = "payments-dev"
    class_name         = "small"
    description        = "Payments development namespace"
    storage_limit      = "100Gi"
    cpu_limit          = "4000M"
    cpu_reservation    = "0M"
    memory_limit       = "8192Mi"
    memory_reservation = "0Mi"
  }
}

variable "shared_subnets" {
  type = map(object({
    name         = string
    description  = string
    subnet_type  = string
    gateway_cidr = string
    vlan_id      = number
  }))
  description = "Shared subnets to create in the selected region"
  default = {
    legacy_services = {
      name         = "legacy-services-vlan-123"
      description  = "Shared VLAN subnet for legacy service connectivity"
      subnet_type  = "VLAN"
      gateway_cidr = "10.123.0.1/24"
      vlan_id      = 123
    }
  }
}

variable "content_library_name" {
  type        = string
  description = "Content library name. Defaults to org_name-library when null."
  default     = null
}

variable "content_library_description" {
  type        = string
  description = "Content library description. Defaults to org_display_name content library when null."
  default     = null
}

variable "content_library_auto_attach" {
  type        = bool
  description = "Automatically attach the content library"
  default     = false
}

variable "content_library_delete_recursive" {
  type        = bool
  description = "Delete content library items recursively"
  default     = true
}

locals {
  namespace_vpc_name          = coalesce(var.vpc_name, "default-${var.region_name}")
  regional_networking_name    = coalesce(var.regional_networking_name, "${var.org_name}${var.region_name}")
  content_library_name        = coalesce(var.content_library_name, "${var.org_name}-library")
  content_library_description = coalesce(var.content_library_description, "${var.org_display_name} content library")
}
