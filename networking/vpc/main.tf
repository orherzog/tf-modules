################################################################################
# VPC Module
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.0"

  name = var.env
  cidr = var.vpc_cidr

  azs             = local.azs
  private_subnets = [for k, v in locals.azs : cidrsubnet(var.vpc_cidr, 4, k)]
}