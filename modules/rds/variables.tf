variable "db_instance_identifier" {
  description = "The identifier for the DB instance"
  type        = string
}

variable "allocated_storage" {
  description = "The amount of storage (in gigabytes) to allocate for the DB instance"
  type        = number
  default     = 20
}

variable "storage_type" {
  description = "The storage type for the DB instance (e.g., standard, gp2, io1)"
  type        = string
  default     = "gp2"
}

variable "engine" {
  description = "The database engine to use (e.g., mysql, postgres)"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "The version of the database engine to use"
  type        = string
}

variable "instance_class" {
  description = "The instance class for the DB instance (e.g., db.t3.micro)"
  type        = string
}

variable "db_name" {
  description = "The name of the database to create"
  type        = string
}

variable "username" {
  description = "The username for the database"
  type        = string
}

variable "password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
}

variable "db_subnet_group_name" {
  description = "The name of the DB subnet group"
  type        = string
  default     = ""
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the DB instance"
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "List of subnet IDs to use for the DB subnet group"
  type        = list(string)
  default     = []
}

variable "backup_retention_period" {
  description = "The number of days to retain backups for"
  type        = number
  default     = 7
}

variable "backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "03:00-06:00"
}

variable "maintenance_window" {
  description = "The weekly time range during which system maintenance can occur"
  type        = string
  default     = "Mon:00:00-Mon:03:00"
}

variable "storage_encrypted" {
  description = "Whether to enable encryption for the DB instance"
  type        = bool
  default     = false
}

variable "kms_key_id" {
  description = "The ARN of the KMS key for encryption (if enabled)"
  type        = string
  default     = ""
}

variable "performance_insights_enabled" {
  description = "Whether to enable Performance Insights"
  type        = bool
  default     = false
}

variable "performance_insights_kms_key_id" {
  description = "The ARN of the KMS key for Performance Insights encryption (if enabled)"
  type        = string
  default     = ""
}

variable "deletion_protection" {
  description = "Whether to enable deletion protection"
  type        = bool
  default     = false
}

variable "multi_az" {
  description = "Whether to create a Multi-AZ deployment"
  type        = bool
  default     = false
}

variable "publicly_accessible" {
  description = "Whether the DB instance is publicly accessible"
  type        = bool
  default     = false
}

variable "final_snapshot_identifier" {
  description = "The name of the final snapshot to create when the DB instance is deleted"
  type        = string
  default     = ""
}

variable "skip_final_snapshot" {
  description = "Whether to skip creating a final snapshot when deleting the DB instance"
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}
