variable "vpc_dns_support" {
    type = bool
    default = true
}
variable "vpc_dns_hostnames" {
    type = bool
    default = true
}
variable "vpc_cidr_block" {
    type = string
    default = "10.0.0.0/16"
}
variable "vpc_tags" {
  type        = map(string)
}