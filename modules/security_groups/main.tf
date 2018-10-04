
resource "aws_security_group" "sg_cluster" {
  name = "sg_${var.environment}"
  description = "Allows all traffic"
  vpc_id = "${var.vpc_id}"

  tags {
    Environment   = "${var.environment}"
    Cluster       = "${var.environment}"
  }
}

# aws_security_group outside of this module
resource "aws_security_group_rule" "outbound_access_http_spec" {
  type              = "ingress"
  from_port         = 8080
  to_port           = 8080
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_cluster.id}"
}
# aws_security_group outside of this module
resource "aws_security_group_rule" "inbound_access_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_cluster.id}"
}

# aws_security_group outside of this module
resource "aws_security_group_rule" "inbound_access_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_cluster.id}"
}


# aws_security_group outside of this module
resource "aws_security_group_rule" "inbound_access_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_cluster.id}"
}


# aws_security_group outside of this module
resource "aws_security_group_rule" "inbound_access_jen" {
  type              = "ingress"
  from_port         = 50000
  to_port           = 50000
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_cluster.id}"
}

# aws_security_group outside of this module
resource "aws_security_group_rule" "outbound_internet_access" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.sg_cluster.id}"
}
