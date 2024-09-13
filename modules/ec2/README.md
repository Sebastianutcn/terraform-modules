# EC2 Module

This Terraform module creates an EC2 instance in AWS with customizable options such as instance type, security groups, block storage, and Elastic IPs.

## Usage

```hcl
module "ec2_instance" {
  source = "./ec2"

  ami_id             = "ami-0abcdef1234567890"
  instance_type      = "t2.micro"
  key_name           = "my-key-pair"
  subnet_id          = aws_subnet.my_subnet.id
  security_group_ids = [aws_security_group.my_sg.id]
  root_volume_size   = 10
  allocate_eip       = true

  tags = {
    Name        = "MyEC2Instance"
    Environment = "production"
  }
}
