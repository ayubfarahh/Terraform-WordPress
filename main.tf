module "ec2" {
    source = "./modules/ec2"
    cidr_allow = var.cidr_allow
    http_ports = var.http_ports
    ssh_ports = var.ssh_ports

    db_user = var.db_user
    db_password = var.db_password
    db_host = module.rds.db_endpoint
    
}

module "rds" {
    source = "./modules/rds"
    cidr_allow = var.cidr_allow
    http_ports = var.http_ports
    ssh_ports = var.ssh_ports

    wordpress_sg_id = module.ec2.wordpress_sg_id

    db_user = var.db_user
    db_password = var.db_password

   
  
}