variable "http_ports" {
    type = number
  
}

variable "ssh_ports" {
    type = number
  
}

variable "cidr_allow" {
    type = list(string)
  
}

variable "db_user" {
    type = string
    sensitive = true
  
}

variable "db_password" {
    type = string
    sensitive = true
  
}

variable "wordpress_sg_id" {
    type = string
  
}

variable "sql_port" {
    type = number
  
}

variable "tcp_protocol" {
    type = string
  
}

variable "db_subnet_group" {
    type = string
  
}

variable "vpc_id" {
    type = string
  
}

variable "allocated_storage" {
    type = string
  
}

variable "instance_class" {
    type = string
  
}

variable "engine" {
    type = string
  
}

variable "engine_version" {
    type = string
  
}


variable "identifier" {
    type = string
  
}

variable "db_name" {
    type = string
  
}

variable "parameter_group_name" {
    type = string  
}

variable "db_tag" {
    type = string
  
}

variable "rds_sg_name" {
    type = string
  
}