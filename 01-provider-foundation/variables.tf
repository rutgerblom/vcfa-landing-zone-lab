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

variable "oidc_enabled" {
  type        = bool
  description = "Enable OIDC for the organization"
  default     = true
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

variable "tenant_admin_password" {
  type        = string
  description = "Password for the initial local organization administrator"
  sensitive   = true
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

locals {
  namespace_vpc_name = coalesce(var.vpc_name, "default-${var.region_name}")
}