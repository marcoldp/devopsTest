resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16" 
  #required if we want to provision database in our VPC that will be publicly accessible to check
  enable_dns_hostnames = true
  enable_dns_support   = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
}

# each subnet has to be associated with a route table
resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_route_table" "r" {
  vpc_id = aws_vpc.main.id

  # routes all incoming traffic to gateway - ipv4
  route { 
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.gw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.r.id
}
