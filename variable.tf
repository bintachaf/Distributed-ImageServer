variable "kubernetes_version" {
  default     = 1.29
  description = "kubernetes version"
}

variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "default CIDR range of the VPC"
}
variable "aws_region" {
  default     = "eu-west-1"
  description = "Default AWS region in Europe"
}

variable "aws_region_asia" {
  default     = "ap-southeast-1"
  description = "Default AWS region in Asia"
}

variable "aws_region_north_america" {
  default     = "us-east-1"
  description = "Default AWS region in North America"
}
