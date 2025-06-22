resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
  
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet_cidr
    availability_zone = var.public_subnet_az
    map_public_ip_on_launch = true
  
}

resource "aws_subnet" "public_subnet_backup" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnet_backup_cidr
    availability_zone = var.public_subnet_backup_az
    map_public_ip_on_launch = true
  
}

resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
  
}

resource "aws_route_table_association" "rt_association" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "rt_association_backup" {
    subnet_id = aws_subnet.public_subnet_backup.id
    route_table_id = aws_route_table.route_table.id
}

resource "aws_db_subnet_group" "db_subnet" {
  name       = "db_subnet"
  subnet_ids = [aws_subnet.public_subnet.id, aws_subnet.public_subnet_backup.id]

  tags = {
    Name = "My DB subnet group"
  }
}