# AWS CodeDeploy Module

This Terraform module creates an AWS CodeDeploy application and deployment group.

## Usage

module "codedeploy" {
  source = "./codedeploy"

  app_name              = "example-codedeploy-app"
  deployment_group_name = "example-deployment-group"
  service_role_arn      = aws_iam_role.codedeploy_role.arn
  deployment_config_name = "CodeDeployDefault.OneAtATime"
  elb_name              = aws_elb.example_elb.name
  ec2_tag_key           = "Name"
  ec2_tag_value         = "example-instance"
  auto_scaling_groups   = [aws_autoscaling_group.example_asg.name]

  tags = {
    Environment = "prod"
    Project     = "example-project"
  }
}
