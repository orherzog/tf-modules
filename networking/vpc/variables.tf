variable "env" {
    default = "env"
    description = "Environment name"
    type = string
}
variable "vpc_cidr" {
    default = "192.168.0.0/16"
    description = "CIDR block for VPC"
    type = string
}
variable "num_azs" {
    default = 3
    description = "Number of availability zones to use"
    type = number
}