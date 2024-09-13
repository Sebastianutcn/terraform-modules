# Create EC2 instance
resource "aws_instance" "ec2_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  associate_public_ip_address = var.associate_public_ip

  # Security Groups
  vpc_security_group_ids = var.security_group_ids

  # Block device configuration (for EBS volumes)
  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    delete_on_termination = true
  }

  # Tags
  tags = var.tags

  # Custom user data script (optional)
  user_data = var.user_data

  # Enable/Disable monitoring
  monitoring = var.enable_monitoring
}

