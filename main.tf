module "vpc" {
 source  = "terraform-aws-modules/vpc/aws"


 name = "WS-2025-2201-vpc"
 cidr = "10.0.0.0/16"


 azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
 private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
 public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

# Database subnets
database_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

 enable_nat_gateway   = true
 single_nat_gateway   = true
 enable_dns_hostnames = true


# Enable database subnet group
create_database_subnet_group = true

tags = {
  Terraform = "true"
  Environment = "prod"
}


}

output "nat_gateway_ids" {
    description = "list of NAT gateway ID"
    value       = module.vpc.natgw_ids
}

output "private_subnets_ids" {
    description = "list of Privite Subnet ID"
    value       = module.vpc.private_subnets
}

module "app_topics" {
 source      = "./modules/app_topics"
 name_prefix = "example"
}

