variable "subnet_id" {}
variable "security_groups" {}

variable "instance_ami" {
  type = string
}
variable "instance_type" {
  type = string
}
variable "instance_tags" {
    type = map(string)
}
