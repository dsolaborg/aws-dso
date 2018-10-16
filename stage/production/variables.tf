variable "vpc_cidr" {
	default = "10.10.0.0/16"
}
variable "environment" 
	default = "production"
}
variable "region" {
  default = "us-east-1"
}
variable "bucket_name" {
	default = "dso-lab-2018appseco"
}

provider "aws" {
  version = "~> 1.0"
  region  = "${var.region}"
}

provider "template" {
  version = "~> 1.0"
}

variable "private_subnet_cidrs" {
  type = "list"
  default = ["10.10.170.0/24", "10.10.180.0/24"]
}

variable "public_subnet_cidrs" {
  type = "list"
  default = ["10.10.150.0/24", "10.10.160.0/24"]
}

variable "availability_zones" {
  type = "list"
  default = ["us-east-1a", "us-east-1b"]
}
