resource "aws_db_instance" "rds" {
  allocated_storage = 5
  engine = "mysql"
  engine_version = "8.0.20"
  instance_class = "db.t2.micro"
  port = "3306"
  name = var.db_name
  username = var.db_username
  password = var.db_pwd
  db_subnet_group_name = aws_db_subnet_group.public.id
  vpc_security_group_ids=[aws_security_group.rds.id] 
  publicly_accessible=true
  multi_az=false
}

#add publicly available subnet to do
resource "aws_db_subnet_group" "public" {
  subnet_ids = [aws_subnet.public.id,aws_subnet.other.id ] 
}

# To solve bug - temp solution
# Error creating DB Subnet Group: DBSubnetGroupDoesNotCoverEnoughAZs: Please add subnets to cover at least 2 availability zones.
resource "aws_subnet" "other" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "eu-west-3a"
}
