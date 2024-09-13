variable "ami_id" {
  description = "The AMI ID to launch the instance with"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair to use for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID where the instance will be deployed"
  type        = string
}

variable "associate_public_ip" {
  description = "Whether to associate a public IP address"
  type        = bool
  default     = true
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instance"
  type        = list(string)
  default     = []
}

variable "root_volume_size" {
  description = "Size of the root EBS volume in GiB"
  type        = number
  default     = 8
}

variable "root_volume_type" {
  description = "Type of the root EBS volume (e.g., gp2, io1)"
  type        = string
  default     = "gp2"
}

variable "enable_monitoring" {
  description = "Whether to enable detailed monitoring on the instance"
  type        = bool
  default     = false
}

variable "user_data" {
  description = "The user data script to use for the instance"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to assign to the instance"
  type        = map(string)
  default     = {}
}
