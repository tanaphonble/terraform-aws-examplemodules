resource "aws_db_instance" "instance" {
  identifier_prefix         = var.identifier_prefix
  engine                    = "mysql"
  allocated_storage         = 10
  instance_class            = var.db_instance_class
  name                      = var.db_name
  username                  = var.db_username
  final_snapshot_identifier = "${var.identifier_prefix}-identifier"
  password                  = var.db_password
}


