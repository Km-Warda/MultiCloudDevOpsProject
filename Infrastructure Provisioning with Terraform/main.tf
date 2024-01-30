module "vpc" {
  source = "./modules/VPC"
  cidr_block = var.primary_vpc_cidr_block
  enable_dns_support = var.primary_vpc_dns_support 
  enable_dns_hostnames = var.primary_vpc_dns_hostnames
  tags = {
    Name = var.primary_vpc_tags
  }
}

module "public_subnet" {
  source  = "./modules/Subnet"
  vpc_id  = module.vpc.vpc_id
  cidr_block = var.primary_public_subnet_cidr_block
  availability_zone = var.primary_availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = var.primary_public_subnet_tags
}
}

module "security_group" {
  source  = "./modules/Security Group"
  vpc_id  = module.vpc.vpc_id
  sg_ingress_rule  = var.custom_sg_ingress_rule
  sg_egress_rule   = var.custom_sg_egress_rule
  tags = {
    Name = var.primary_sg_tags
  }
}

module "ec2_instance" {
  source          = "./modules/EC2"
  subnet_id       = module.public_subnet.subnet_id
  vpc_security_group_ids = [module.security_group.security_group_id]
  ami             = var.primary_instance_ami
  instance_type   = var.primary_instance_type
  tags = {
    Name = var.primary_instance_tags
  }
}