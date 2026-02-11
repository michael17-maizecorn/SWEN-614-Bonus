resource "aws_db_subnet_group" "this" {
  name_prefix = "wordpress-db-subnet-group"
  subnet_ids = var.subnet_ids
  tags = { Name = "WordPress DB Subnet Group" }
}

resource "aws_db_instance" "this" {
  identifier              = "wordpress-db"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password
  parameter_group_name    = "default.mysql8.0"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [var.rds_sg_id]
  db_subnet_group_name    = aws_db_subnet_group.this.name
}