# CloudWatch Dashboard Module

This Terraform module creates an AWS CloudWatch Dashboard with customizable widgets for monitoring various resources like EC2, RDS, ECS, and Lambda.

## Usage

```hcl
module "cloudwatch_dashboard" {
  source = "./cloudwatch_dashboard"

  dashboard_name = "my-dashboard"

  widgets = [
    {
      "type": "metric",
      "x": 0,
      "y": 0,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/EC2", "CPUUtilization", "InstanceId", "i-0123456789abcdef0" ]
        ],
        "title": "EC2 CPU Utilization"
      }
    },
    {
      "type": "metric",
      "x": 6,
      "y": 0,
      "width": 6,
      "height": 6,
      "properties": {
        "metrics": [
          [ "AWS/RDS", "CPUUtilization", "DBInstanceIdentifier", "mydbinstance" ]
        ],
        "title": "RDS CPU Utilization"
      }
    }
  ]

  tags = {
    Environment = "production"
  }
}
