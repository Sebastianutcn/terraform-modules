# Create RDS instance
resource "aws_db_instance" "db_instance" {
  identifier        = var.db_instance_identifier
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type
  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_class
  name              = var.db_name
  username          = var.username
  password          = var.password
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids

  # Backup and maintenance
  backup_retention_period = var.backup_retention_period
  backup_window           = var.backup_window
  maintenance_window      = var.maintenance_window

  # Encryption and performance
  storage_encrypted   = var.storage_encrypted
  kms_key_id          = var.kms_key_id
  performance_insights_enabled = var.performance_insights_enabled
  performance_insights_kms_key_id = var.performance_insights_kms_key_id

  # Deletion protection
  deletion_protection = var.deletion_protection

  # Tags
  tags = var.tags

  # Optional parameters
  multi_az                      = var.multi_az
  publicly_accessible           = var.publicly_accessible
  final_snapshot_identifier     = var.final_snapshot_identifier
  skip_final_snapshot           = var.skip_final_snapshot
}

# Create DB subnet group if not provided
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids
  tags = var.tags
  count = var.db_subnet_group_name == "" ? 1 : 0
}
