variable "cidr_allow" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "http_ports" {  
    type = number
    default = 80
}

variable "ssh_ports" {
    type = number
    default = 22
}

variable "db_user" {
    type = string
    sensitive = true
  
}

variable "db_password" {
    type = string
    sensitive = true
  
}

variable "sql_port" {
    type = number
    default = 3306
  
}

variable "tcp_protocol" {
    type = string
    default = "tcp"
  
}

variable "allocated_storage" {
    type = number
  
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

variable "ami" {
    type = string
  
}

variable "instance_type" {
    type = string
  
}

variable "vpc_cidr" {
    type = string
  
}

variable "public_subnet_cidr" {
    type = string
  
}

variable "public_subnet_backup_cidr" {
    type = string
  
}

variable "public_subnet_az" {
    type = string
  
}

variable "public_subnet_backup_az" {
    type = string
  
}

variable "rds_sg_name" {
    type = string
  
}

variable "wordpress_sg_name" {
    type = string
  
}

variable "wordpress_instance_name" {
    type = string
  
}