# CloudWatch Monitoring and Alerting Module

This Terraform module sets up CloudWatch Alarms for monitoring AWS resources and sends alerts via SNS to subscribed endpoints (e.g., email, Lambda, or HTTP/HTTPS).

## Usage

```hcl
module "cloudwatch_sns_alerting" {
  source = "./cloudwatch_sns_alerting"

  sns_topic_name = "critical-alarms"

  sns_subscriptions = {
    email_alert = {
      protocol = "email"
      endpoint = "alerts@example.com"
    },
    sms_alert = {
      protocol = "sms"
      endpoint = "+1234567890"
    }
  }

  cloudwatch_alarms = {
    ec2_cpu_high = {
      alarm_name                = "HighEC2CPUUsage"
      comparison_operator       = "GreaterThanThreshold"
      evaluation_periods        = 2
      metric_name               = "CPUUtilization"
      namespace                 = "AWS/EC2"
      period                    = 300
      statistic                 = "Average"
      threshold                 = 80
      alarm_description         = "Triggered when EC2 CPU usage is above 80%"
      dimensions                = { InstanceId = "i-0123456789abcdef0" }
      insufficient_data_actions = []
      ok_actions                = []
    }
  }

  tags = {
    Environment = "production"
  }
}
