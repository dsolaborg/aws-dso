variable "vpc_cidr" {}
variable "environment" {}
variable "region" {}
variable "bucket_name" {}

provider "aws" {
  version = "~> 1.0"
  region  = "${var.region}"
}

provider "template" {
  version = "~> 1.0"
}

variable "private_subnet_cidrs" {
  type = "list"
}

variable "public_subnet_cidrs" {
  type = "list"
}

variable "availability_zones" {
  type = "list"
}
