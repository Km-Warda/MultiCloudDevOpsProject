#Defining the VPC ID from the output of the VPC module
variable "vpc_id" {}


variable "sg_ingress_rule" {
  type = map(object({
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  }))
}

variable "sg_egress_rule" {
  type = map(object({
  from_port   = number
  to_port     = number
  protocol    = string
  cidr_blocks = list(string)
  }))
}

variable "sg_tags" {
    type = map(string)
}