resource "aws_db_instance" "mysql-db" {
  identifier = "mysql-db"
  engine = "mysql"
  engine_version = "8.0.26"
  instance_class = "db.t2.micro"
  allocated_storage = 20
  storage_type = "gp2"
  publicly_accessible = false
  name = "${var.database-name}db"
  username = var.database-user
  password = var.database-password
  backup_retention_period    = 0
  maintenance_window         = "Mon:00:00-Mon:03:00"
  backup_window              = "00:00-00:15"
  vpc_security_group_ids = [ aws_security_group.mysql-db.id ]
  db_subnet_group_name = aws_db_subnet_group.database-subnet-group.name
}

resource "aws_db_subnet_group" "database-subnet-group" {
  name       = "database-subnet-group"
  subnet_ids = [aws_subnet.private-subnet-1.id,aws_subnet.private-subnet-2.id]
}

resource "aws_security_group" "mysql-db" {
  name        = "mysql-db-security-group"
  description = "Database SG"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}