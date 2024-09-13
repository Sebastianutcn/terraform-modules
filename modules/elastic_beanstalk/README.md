# Elastic Beanstalk Terraform Module

This module provisions an AWS Elastic Beanstalk application and environment, along with associated resources like IAM roles, instance profiles, and security groups.

## Usage

```hcl
module "elastic_beanstalk" {
  source = "./elastic_beanstalk"

  application_name        = "my-app"
  environment_name        = "my-app-env"
  solution_stack_name     = "64bit Amazon Linux 2 v3.1.2 running Node.js 14"
  instance_type           = "t2.micro"
  environment_type        = "LoadBalanced"
  environment_variables   = {
    NODE_ENV = "production"
    API_URL  = "https://api.example.com"
  }
  vpc_id                  = "vpc-0abcd1234efgh5678"
  ingress_from_port       = 80
  ingress_to_port         = 80
  ingress_protocol        = "tcp"
  ingress_cidr_blocks     = ["0.0.0.0/0"]

  tags = {
    Environment = "production"
    Application = "my-app"
  }
}
