################################################################################
# VPC Module
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.0"

  name = var.env
  cidr = var.vpc_cidr

  # Use the selected availability zones directly
  azs = slice(data.aws_availability_zones.available.names, 0, var.num_azs)

  # Create private subnets in each selected AZ
  private_subnets = [for k in range(var.num_azs) : cidrsubnet(var.vpc_cidr, 4, k)]
}