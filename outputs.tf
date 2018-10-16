output "vpc_id" {
  value = "${module.network.vpc_id}"
}

output "vpc_cidr" {
  value = "${module.network.vpc_cidr}"
}

output "private_subnet_ids" {
  value = "${module.network.private_subnet_ids}"
}

output "public_subnet_ids" {
  value = "${module.network.public_subnet_ids}"
}

output "security_group_id" {
  value = "${module.network.security_group_id}"
}

output "environment_name" {
  value = "${var.environment}"
}

output "rds_security_group_id" {
  value = "${module.network.sg_id}"
}
