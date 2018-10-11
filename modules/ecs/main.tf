
#resource "aws_autoscaling_group" "asg_ecs" {
#  name = "asg_${var.environment}"
#  min_size = "${var.min_instance_size}"
#  max_size = "${var.max_instance_size}"
#  desired_capacity = "${var.desired_instance_capacity}"
#  health_check_type = "EC2"
#  health_check_grace_period = 300
#  #launch_configuration = "${aws_launch_configuration.lc_ecs.name}"
#  vpc_zone_identifier = ["${var.subnet}"]
#
#  lifecycle {
#    create_before_destroy = true
#  }
#
#  tag {
#    key = "Name"
#    value = "${var.environment}_asg"
#    propagate_at_launch = true
#  }
#}

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
