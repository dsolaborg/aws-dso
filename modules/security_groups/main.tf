
resource "aws_security_group" "sg_cluster" {
  name = "sg_${var.environment}"
  description = "Allows all traffic"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }
  ingress {
    from_port   = "50000"
    to_port     = "50000"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  egress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self        = true
  }

  tags {
    Environment   = "${var.environment}"
    Cluster       = "${var.environment}"
  }
}
