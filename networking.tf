resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support     = true
  tags = {
    Name = "Test-vpc"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "${var.region}a"
}
resource "aws_subnet" "public-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${var.region}b"
}
resource "aws_route_table" "public-route-table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Public-Route-Table"
  }
}
resource "aws_route" "route-to-internet-gateway" {
  route_table_id = aws_route_table.public-route-table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc-internet-gateway.id
}
resource "aws_route_table_association" "public-rt-subnet1-association" {
  subnet_id = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.public-route-table.id
}
resource "aws_route_table_association" "public-rt-subnet2-association" {
  subnet_id = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.public-route-table.id
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "${var.region}c"
}
resource "aws_subnet" "private-subnet-2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "${var.region}d"
}
resource "aws_route_table" "Private-Route-Table" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Private-Route-Table"
  }
}
resource "aws_route_table_association" "private-rt-subnet1-association" {
  route_table_id = aws_route_table.Private-Route-Table.id
  subnet_id = aws_subnet.private-subnet-1.id
}
resource "aws_route_table_association" "private-rt-subnet2-association" {
  route_table_id = aws_route_table.Private-Route-Table.id
  subnet_id = aws_subnet.private-subnet-2.id
}

resource "aws_internet_gateway" "vpc-internet-gateway" {
  vpc_id = aws_vpc.vpc.id
  depends_on = [ aws_vpc.vpc ]
  tags = {
    Name = "vpc-igw"
  }
}