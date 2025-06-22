//RDS 
rds_sg_name = "rds_sg"
identifier = "wordpress-db"
allocated_storage = 20
instance_class = "db.m5.large"
engine = "mysql"
engine_version = "8.0"
db_name = "wordpress"
parameter_group_name = "default.mysql8.0"
db_tag = "Production RDS"

// EC2
ami = "ami-044415bb13eee2391"
instance_type = "m5.large"
http_ports = 80
ssh_ports = 22
cidr_allow = ["0.0.0.0/0"]
tcp_protocol = "tcp"
sql_port = 3306
wordpress_sg_name = "allow_traffic"
wordpress_instance_name = "Wordpress"

// VPC
vpc_cidr = "10.0.0.0/24"
public_subnet_cidr = "10.0.0.0/25"
public_subnet_backup_cidr = "10.0.0.128/26"
public_subnet_az = "eu-west-2a"
public_subnet_backup_az = "eu-west-2b"