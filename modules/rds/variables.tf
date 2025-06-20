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