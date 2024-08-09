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

  public_subnets   = [for k in range(length(local.azs)) : cidrsubnet(var.vpc_cidr, 4, k)]
  private_subnets  = [for k in range(length(local.azs)) : cidrsubnet(var.vpc_cidr, 4, k + 4)]
  database_subnets = [for k in range(length(local.azs)) : cidrsubnet(var.vpc_cidr, 4, k + 8)]

  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_nat_gateway = true
  single_nat_gateway = true

  # VPC Flow Logs (Cloudwatch log group and IAM role will be created)
  vpc_flow_log_iam_role_name            = "vpc-complete-example-role"
  vpc_flow_log_iam_role_use_name_prefix = false
  enable_flow_log                       = true
  create_flow_log_cloudwatch_log_group  = true
  create_flow_log_cloudwatch_iam_role   = true
  flow_log_max_aggregation_interval     = 60
}