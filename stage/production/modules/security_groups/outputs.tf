
output "security_group_id" {
  value = "${aws_security_group.sg_cluster.id}"
}

output "sg_id" {
  value = "${aws_security_group.rds.id}"
}
