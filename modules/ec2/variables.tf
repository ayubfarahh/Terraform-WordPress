variable "cidr_allow" {
    type = list(string)
}

variable "http_ports" {
  type = number
}

variable "ssh_ports" {
  type = number
}

locals {
  ami = "ami-044415bb13eee2391"
  instance_type = "t2.micro"
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type = string
}

variable "db_host" {
  type = string
}

variable "tcp_protocol" {
  type = string
  
}

variable "vpc_id" {
  type = string
  
}

variable "pub_subnet_id" {
  type = string
  
}