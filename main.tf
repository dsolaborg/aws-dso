
# Backup the terraform tfstate
data "terraform_remote_state" "tfstate" {
  backend = "s3"
  config {
    bucket = "${var.bucket_name}"
    key = "${var.environment}/lab/terraform.tfstate"
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
