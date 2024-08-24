#Defining the VPC ID from the output of the VPC module
variable "vpc_id" {}


variable "subnet_cidr_block" {
    type = string
}
variable "availability_zone" {
    type = string
}
variable "subnet_tags" {
    type = map(string)
}

# True for public subnet creation, False for private subnet creation
variable "public_subnet_enable" {
  type = bool
}
