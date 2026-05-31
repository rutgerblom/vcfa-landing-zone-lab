terraform {
  required_providers {
    vcfa = {
      source  = "vmware/vcfa"
      version = "~> 1.1.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.38"
    }
  }
}