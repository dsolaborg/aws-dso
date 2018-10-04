# Production Environment
region = "us-east-1"
vpc_cidr = "10.10.0.0/16"
environment = "production"
public_subnet_cidrs = ["10.10.0.0/24", "10.10.0.0/24"]
private_subnet_cidrs = ["10.10.0.0/24", "10.10.0.0/24"]
availability_zones = ["us-east-1", "us-east-2"]
max_size = 1
min_size = 1
desired_capacity = 1
instance_type = "t2.micro"
keypair_name = ""
