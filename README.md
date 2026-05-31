# VCF Automation Landing Zone Lab

This repository contains Terraform examples used while testing the first layers of a VMware Cloud Foundation Automation All Apps landing zone.

The goal is not to provide a complete production-ready Terraform module. The goal is to document and validate how parts of the landing zone foundation can be represented with Terraform.

## Scope

The examples focus on the early landing zone foundation, including:

* All Apps organization creation
* OIDC identity provider configuration
* Initial local organization bootstrap user
* Regional quota assignment
* Organization networking
* Regional networking
* Optional shared subnet creation
* Content library creation
* Supervisor namespace creation

Some parts of the VCF Automation 9.1 All Apps model are not currently represented end-to-end in these examples. In particular, the project model, VPC creation, external connection creation, shared subnet assignment to an organization, catalog item publishing, policy configuration and approval workflows are outside the current scope.

## Tested environment

These examples were tested in a lab environment with:

* VMware Cloud Foundation Automation 9.1
* Terraform 1.15.5
* `vmware/vcfa` Terraform provider 1.1.0
* macOS on Apple Silicon as the Terraform client

## Important notes

This repository is intentionally lab-oriented.

The examples may contain assumptions that are specific to my environment, such as region names, storage policy names, namespace classes, VPC names and organization naming conventions. Review all variables and resource names before using the configuration in another environment.

The Terraform provider does not currently appear to expose every VCF Automation 9.1 construct as a first-class resource. Some workflows may still require the UI, import, direct API usage or other automation methods.

## Usage

Create a local `terraform.tfvars` file based on the variables used in the configuration.

Do not commit `terraform.tfvars`, state files, plan files or log files to Git.

Typical workflow:

```bash
terraform init
terraform fmt -recursive
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
```

For troubleshooting provider/API behavior, debug logging can be enabled with:

```bash
export TF_LOG_PATH=tf.log
export TF_LOG=TRACE
export GOVCD_LOG_FILE=go-vcloud-director.log
export GOVCD_LOG=true
```

Be careful with debug logs. They may contain tokens, cookies, client secrets or other sensitive values. Redact them before sharing.

## Disclaimer

These examples are provided as-is for lab and learning purposes. They are not a supported reference architecture and should not be used unchanged in production.
