variable "subnet_id" {}
variable "security_groups" {}

variable "instance_ami" {
  type = string
  default = "ami-0c55b159cbfafe1f0"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "instance_tags" {
    type = map(string)
}