terraform {
  # Live modules pin exact Terraform version; generic modules let consumers pin the version.
  # The latest version of Terragrunt (v0.36.0 and above) recommends Terraform 1.1.4 or above.
  required_version = "~ 1.3.6"

  # Live modules pin exact provider version; generic modules let consumers pin the version.
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 4.46.0"
    }
  }
}

terraform {
  backend "s3" {}
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = var.name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = var.enable_nat_gateway
  enable_vpn_gateway = var.enable_vpn_gateway

  tags = var.tags
}
