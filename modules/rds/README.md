# RDS Instance Terraform Module

This module provisions an RDS instance with various configurable options such as instance type, storage type, backup retention, encryption, and more.

## Usage

```hcl
module "rds" {
  source = "./rds"

  db_instance_identifier = "my-db-instance"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_name                = "mydatabase"
  username               = "admin"
  password               = "mypassword"

  db_subnet_group_name   = "my-db-subnet-group"
  vpc_security_group_ids = ["sg-12345678"]
  subnet_ids             = ["subnet-12345678", "subnet-87654321"]

  backup_retention_period = 7
  backup_window           = "03:00-06:00"
  maintenance_window      = "Mon:00:00-Mon:03:00"
  storage_encrypted       = true
  kms_key_id              = "arn:aws:kms:region:account-id:key/key-id"
  performance_insights_enabled = true
  performance_insights_kms_key_id = "arn:aws:kms:region:account-id:key/key-id"
  deletion_protection     = true
  multi_az                = true
  publicly_accessible     = false
  final_snapshot_identifier = "my-db-instance-final-snapshot"
  skip_final_snapshot     = false

  tags = {
    Environment = "production"
    Project     = "my-project"
  }
}
