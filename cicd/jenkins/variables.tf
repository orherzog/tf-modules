variable "instance_type" {
  default = "t3.small"
  description = "EC2 instance type for jenkins server"
  type = string
}

variable "instance_name" {
  default = "jenkins-server"
  description = "Name for EC2 instance name"
  type = string
}
variable "key_name" {
  default = "jenkins-key"
  description = "EC2 key pair for jenkins server"
  type = string
}

variable "subnet_id" {
  default = "subnet_id"
  description = "Subnet id to launch the jenkins server"
  type = string
}

variable "vpc_id" {
  default = "vpc_id"
  description = "VPC id to launch the jenkins server"
  type = string
}

variable "sg_name" {
  default = "jenkins_sg"
  description = "Security group name for jenkins server"
  type = string
}

variable "iam_role" {
  default = "jenkins_role"
  description = "IAM role name for jenkins server"
  type = string
}

variable "instance_profile_name" {
  default = "jenkins_profile"
  description = "Instance profile name for jenkins server"
  type = string 
}