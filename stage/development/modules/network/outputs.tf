output "vpc_id" {
  value = "${module.vpc.id}"
}

output "vpc_cidr" {
  value = "${module.vpc.cidr_block}"
}

output "private_subnet_ids" {
  value = "${module.private_subnet.ids}"
}

output "public_subnet_ids" {
  value = "${module.public_subnet.ids}"
}

output "security_group_id" {
  value = "${module.security_groups.security_group_id}"
}

output "sg_id" {
  value = "${module.security_groups.sg_id}"
}

output "environment_name" {
  value = "${var.environment}"
}

output "availability_zones" {
  value = "${var.availability_zones}"
}
