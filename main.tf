module "ec2" {
    source = "./modules/ec2"
    cidr_allow = var.cidr_allow
    http_ports = var.http_ports
    ssh_ports = var.ssh_ports
    tcp_protocol = var.tcp_protocol

    db_user = var.db_user
    db_password = var.db_password
    db_host = module.rds.db_endpoint
    vpc_id = module.vpc.vpc_id
    pub_subnet_id = module.vpc.pub_subnet_id
    
}

module "rds" {
    source = "./modules/rds"
    cidr_allow = var.cidr_allow
    http_ports = var.http_ports
    ssh_ports = var.ssh_ports

    wordpress_sg_id = module.ec2.wordpress_sg_id

    db_user = var.db_user
    db_password = var.db_password
    sql_port = var.sql_port
    tcp_protocol = var.tcp_protocol
    db_subnet_group = module.vpc.db_subnet_group
    vpc_id = module.vpc.vpc_id

   
  
}

module "vpc" {
    source = "./modules/vpc"
  
}