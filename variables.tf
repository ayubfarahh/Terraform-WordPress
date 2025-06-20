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