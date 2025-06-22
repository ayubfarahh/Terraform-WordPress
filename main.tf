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
    ami = var.ami
    instance_type = var.instance_type
    wordpress_sg_name = var.wordpress_sg_name
    wordpress_instance_name = var.wordpress_instance_name
    
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
    allocated_storage = var.allocated_storage
    instance_class = var.instance_class
    engine = var.engine
    engine_version = var.engine_version
    identifier = var.identifier
    db_name = var.db_name
    parameter_group_name = var.parameter_group_name
    db_tag = var.db_tag
    rds_sg_name = var.rds_sg_name

   
  
}

module "vpc" {
    source = "./modules/vpc"
    public_subnet_cidr = var.public_subnet_cidr
    vpc_cidr = var.vpc_cidr
    public_subnet_backup_cidr = var.public_subnet_backup_cidr
    public_subnet_az = var.public_subnet_az
    public_subnet_backup_az = var.public_subnet_backup_az
}