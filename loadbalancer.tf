resource "aws_security_group" "loadbalancer-security-group" {
  name="loadbalancer-security-group"
  description = "Allow load balancer to receive internet connections"
  vpc_id = aws_vpc.vpc.id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "loadbalancer-security-group"
  }
}

resource "aws_lb" "internet-facing-loadbalancer" {
  name = "internet-facing-loadbalancer"
  load_balancer_type = "application"
  subnets = [ 
    aws_subnet.public-subnet-1.id,aws_subnet.public-subnet-2.id
  ]
  security_groups = [aws_security_group.loadbalancer-security-group.id]
  internal = false
  tags = {
    Name="Internet-Facing-Loadbalancer"
  }
}