resource "aws_security_group" "rds_sg" {
    name = var.rds_sg_name
    description = "Allow database access from EC2"
    vpc_id = var.vpc_id

    tags = {
      Name = var.rds_sg_name
    }

    ingress{
        from_port = var.sql_port
        to_port = var.sql_port
        protocol = var.tcp_protocol
        security_groups = [var.wordpress_sg_id]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = var.cidr_allow
    }
  
}

resource "aws_db_instance" "rds_mysql" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.db_user
  password             = var.db_password
  parameter_group_name = var.parameter_group_name
  db_subnet_group_name = var.db_subnet_group
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = var.db_tag
  }
}

