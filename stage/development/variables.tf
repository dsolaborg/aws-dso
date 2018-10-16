variable "vpc_cidr" {
	default = "10.10.0.0/16"
}
variable "environment" {
	default = "development"
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
  default = ["10.10.50.0/24", "10.10.60.0/24"]
}

variable "public_subnet_cidrs" {
  type = "list"
  defualt = ["10.10.70.0/24", "10.10.80.0/24"]
}

variable "availability_zones" {
  type = "list"
  default = ["us-east-1a", "us-east-1b"]
}
