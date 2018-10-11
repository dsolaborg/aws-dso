# Variables for the ECS
variable "environment" {}
variable "region" {}
variable "instance_type" {}
variable "min_instance_size" {}
variable "max_instance_size" {}
variable "desired_instance_capacity" {}
variable "subnet" {
  type = "list"
}
