################################################################################
# VPC Module
################################################################################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.12.0"

  name = var.env
  cidr = var.vpc_cidr

  # Use the selected availability zones
  azs = local.azs

  # Create private subnets in each selected AZ
  private_subnets = [for k in range(length(local.azs)) : cidrsubnet(var.vpc_cidr, 4, k)]
}

# Output the selected availability zones for debugging
output "selected_azs" {
  value = local.azs
}