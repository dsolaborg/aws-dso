
module "vpc" {
  source = "../vpc"
  cidr        = "${var.vpc_cidr}"
  environment = "${var.environment}"
}

module "security_groups" {
  source = "../security_groups"
  environment        = "${var.environment}"
  vpc_id             = "${module.vpc.id}"
}

module "private_subnet" {
  source = "../subnet"

  name               = "${var.environment}_private_subnet"
  environment        = "${var.environment}"
  vpc_id             = "${module.vpc.id}"
  cidrs              = "${var.private_subnet_cidrs}"
  availability_zones = "${var.availability_zones}"
}

module "public_subnet" {
  source = "../subnet"

  name               = "${var.environment}_public_subnet"
  environment        = "${var.environment}"
  vpc_id             = "${module.vpc.id}"
  cidrs              = "${var.public_subnet_cidrs}"
  availability_zones = "${var.availability_zones}"
}

module "nat" {
  source = "../nat_gateway"

  subnet_ids   = "${module.public_subnet.ids}"
  subnet_count = "${length(var.public_subnet_cidrs)}"
}

resource "aws_route" "public_igw_route" {
  count                  = "${length(var.public_subnet_cidrs)}"
  route_table_id         = "${element(module.public_subnet.route_table_ids, count.index)}"
  gateway_id             = "${module.vpc.igw}"
  destination_cidr_block = "${var.destination_cidr_block}"
}

resource "aws_route" "private_nat_route" {
  count                  = "${length(var.private_subnet_cidrs)}"
  route_table_id         = "${element(module.private_subnet.route_table_ids, count.index)}"
  nat_gateway_id         = "${element(module.nat.ids, count.index)}"
  destination_cidr_block = "${var.destination_cidr_block}"
}

# ECS Cluster Configuration
module "ecs" {
  source               = "../ecs"
  environment          = "${var.environment}"
  access_key             = "${var.access_key}"
  secret_key             = "${var.secret_key}"
  instance_type             = "${var.instance_type}"
  min_instance_size             = "${var.min_instance_size}"
  max_instance_size             = "${var.max_instance_size}"
  desired_instance_capacity             = "${var.desired_instance_capacity}"
  s3_bucket             = "${var.s3_bucket}"
  region             = "${var.s3_bucket}"
  s3_bucket             = "${var.region}"
  key_name             = "${var.key_name}"
  restore_backup       = "${var.restore_backup}"

  sg_id               = "${module.security_groups.security_group_id}"
  subnet              = [ "${module.public_subnet.ids}" ]

  amis                 = "${lookup(var.amis, var.region)}"
}

# Creating a NAT Gateway takes some time. Some services need the internet (NAT Gateway) before proceeding.
# Therefore we need a way to depend on the NAT Gateway in Terraform and wait until is finished.
# Currently Terraform does not allow module dependency to wait on.
# Therefore we use a workaround described here: https://github.com/hashicorp/terraform/issues/1178#issuecomment-207369534

resource "null_resource" "dummy_dependency" {
  depends_on = ["module.nat"]
}
