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

# Backup the terraform tfstate
data "terraform_remote_state" "tfstate" {
  backend = "s3"
  config {
    bucket = "${var.bucket_name}"
    key = "${var.environment}/terraform.tfstate"
    region = "us-east-1"
  }
}

# Network Configuration
module "network" {
  source               = "modules/network"
  environment          = "${var.environment}"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnet_cidrs  = "${var.public_subnet_cidrs}"
  private_subnet_cidrs = "${var.private_subnet_cidrs}"
  availability_zones   = "${var.availability_zones}"
  depends_id = ""
}
