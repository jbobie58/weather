# VPC Variables
vpc_name       = "Inadev"
vpc_cidr_block = "10.100.0.0/16"
vpc_public_subnets  = ["10.100.101.0/24", "10.100.102.0/24"]
vpc_private_subnets = ["10.100.1.0/24", "10.100.2.0/24"] 
vpc_enable_nat_gateway = true
vpc_single_nat_gateway = true
