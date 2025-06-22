output "db_subnet_group" {
    value = aws_db_subnet_group.db_subnet.name
  
}

output "vpc_id" {
    value = aws_vpc.vpc.id
  
}

output "pub_subnet_id" {
    value = aws_subnet.public_subnet.id
  
}