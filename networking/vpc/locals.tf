locals {
  # Calculate subnet CIDR blocks
  public_subnet_cidrs   = [for i in range(var.num_azs) : cidrsubnet(var.vpc_cidr, 4, i)]
  private_subnet_cidrs  = [for i in range(var.num_azs) : cidrsubnet(var.vpc_cidr, 4, i + var.num_azs)]
  database_subnet_cidrs = [for i in range(var.num_azs) : cidrsubnet(var.vpc_cidr, 4, i + 2 * var.num_azs)]
}