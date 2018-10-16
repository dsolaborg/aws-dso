
resource "aws_ecs_cluster" "ecs-cluster" {
  name = "${var.environment}"
}

resource "aws_iam_role" "host_role" {
  name = "host_role_${var.environment}"
  assume_role_policy = "${file("policies/ecs-role.json")}"
}

resource "aws_iam_role_policy" "instance_role_policy" {
  name = "instance_role_policy_${var.environment}"
  policy = "${file("policies/ecs-instance-role-policy.json")}"
  role = "${aws_iam_role.host_role.id}"
}

resource "aws_iam_instance_profile" "iam_instance_profile" {
  name = "iam_instance_profile_${var.environment}"
  path = "/"
  role = "${aws_iam_role.host_role.name}"
}
