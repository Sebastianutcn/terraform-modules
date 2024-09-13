# VPC Terraform Module

This module creates a VPC along with public and private subnets, a NAT Gateway, and an Internet Gateway. 

## Usage

```hcl
module "vpc" {
  source = "./vpc"

  vpc_name           = "my-vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnets     = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets    = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b"]
  tags = {
    "Environment" = "dev"
  }
}
