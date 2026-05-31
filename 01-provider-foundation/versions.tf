terraform {
  required_version = ">= 1.6.0"

  required_providers {
    vcfa = {
      source  = "vmware/vcfa"
      version = "~> 1.1.0"
    }
  }
}
