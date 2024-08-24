variable "vpc_dns_support" {
    type = bool
}
variable "vpc_dns_hostnames" {
    type = bool
}
variable "vpc_cidr_block" {
    type = string
}
variable "vpc_tags" {
  type        = map(string)
}
