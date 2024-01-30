#Defining the VPC ID from the output of the VPC module
variable "vpc_id" {}


variable "sg_ingress_rule" {
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
    # Add more rules if needed
  }
}

variable "sg_egress_rule" {
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
    # Add more rules if needed
  }
}

variable "sg_tags" {
    type = string
    default = "security_group"
}