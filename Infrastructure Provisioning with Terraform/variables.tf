#VPC resource block variables
variable "primary_vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}
variable "primary_vpc_dns_support" {
    type = bool
    default = true
}
variable "primary_vpc_dns_hostnames" {
    type = bool
    default = true
}
variable "primary_vpc_tags" {
  type = map(string)
  default = {
    Name = "Main_VPC"
    # Add More
  }
}


#Subnet Resource Block Variables
variable "primary_public_subnet_cidr_block" {
    type = string
    default = "10.0.1.0/24"
}
variable "primary_availability_zone" {
    type = string
    default = "us-west-2a"
}
variable "primary_public_subnet_tags" {
  type = map(string)
  default = {
    Name = "Main_Public_Subnet"
    # Add More
  }
}


#Security Group Rules
variable "custom_sg_ingress_rule" {
  type = map(object({
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  }))
  description = "ingress rules for security group"
  default     = {
    example_rule = {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
variable "custom_sg_egress_rule" {
  type = map(object({
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  }))
  description = "Egress rules for security group"
  default     = {
    example_rule = {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

variable "primary_sg_tags" {
  type = map(string)
  default = {
    Name = "Main_security_group"
    # Add More
  }
}


#EC2 Resource Block Variables
variable "primary_instance_ami" {
  type = string
  default = "ami-0c55b159cbfafe1f0"
}
variable "primary_instance_type" {
  type = string
  default = "t2.micro"
}
variable "primary_instance_tags" {
  type = map(string)
  default = {
    Name = "Main_EC2_Instance"
    # Add More
  }
}