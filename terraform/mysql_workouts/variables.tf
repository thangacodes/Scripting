variable "region" {
  type    = string
  default = "ap-south-1"
}
variable "ami_id" {
  type    = string
  default = "ami-0e6329e222e662a52"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "key" {
  type    = string
  default = "admin"
}
variable "sgp" {
  type    = list(string)
  default = ["sg-0fb1052b659369aa8"]
}
variable "taggy" {
  type = map(string)
  default = {
    Owner        = "Thangadurai.Murugan"
    Environment  = "Ansible_Dev"
    BusinessUnit = "Cargo Section"
    ContactEmail = "Thangadurai.Murugan@example.com"
    UsedBy       = "DevOps team"
    TF_VERSION   = "v1.3.4"
  }
}
