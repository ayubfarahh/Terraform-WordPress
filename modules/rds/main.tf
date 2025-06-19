resource "aws_security_group" "rds_sg" {
    name = "rds_sg"
    description = "Allow database access from EC2"

    tags = {
      Name = "rds_sg"
    }

    ingress{
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
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
  allocated_storage    = 10
  db_name              = "wordpress"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_user
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]

  tags = {
    Name = "rds_mysql"
  }
}

