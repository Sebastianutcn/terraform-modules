output "db_instance_identifier" {
  description = "The identifier for the DB instance"
  value       = aws_db_instance.this.id
}

output "db_instance_endpoint" {
  description = "The connection endpoint for the DB instance"
  value       = aws_db_instance.this.endpoint
}

output "db_instance_arn" {
  description = "The ARN of the DB instance"
  value       = aws_db_instance.this.arn
}

output "db_instance_port" {
  description = "The port of the DB instance"
  value       = aws_db_instance.this.port
}

output "db_instance_master_username" {
  description = "The master username for the DB instance"
  value       = aws_db_instance.this.username
}
