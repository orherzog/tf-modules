
# Fetch available availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

# Define local values for selected AZs based on the num_azs variable
locals {
  azs = slice(data.aws_availability_zones.available.names, 0, var.num_azs)
}