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
