# Variables for the ECS
variable "environment" {}
variable "restore_backup" {}
variable "region" {}
variable "amis" {}
variable "instance_type" {}
variable "key_name" {}
variable "min_instance_size" {}
variable "max_instance_size" {}
variable "desired_instance_capacity" {}
variable "s3_bucket" {}
variable "access_key" {}
variable "secret_key" {}
variable "sg_id" {}
variable "subnet" {
  type = "list"
}
