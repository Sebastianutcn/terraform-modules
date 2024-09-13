resource "aws_codedeploy_app" "codedeploy_app" {
  name            = var.app_name
  compute_platform = var.compute_platform
  tags            = var.tags
}

resource "aws_codedeploy_deployment_group" "codedeploy_deployment_group" {
  app_name               = aws_codedeploy_app.codedeploy_app.name
  deployment_group_name  = var.deployment_group_name
  service_role_arn       = var.service_role_arn
  deployment_config_name = var.deployment_config_name

  auto_rollback_configuration {
    enabled = var.auto_rollback_enabled
    events  = var.auto_rollback_events
  }

  deployment_style {
    deployment_type   = var.deployment_type
    deployment_option = var.deployment_option
  }

  load_balancer_info {
    elb_info {
      name = var.elb_name
    }
  }

  ec2_tag_set {
    ec2_tag_filter {
      key   = var.ec2_tag_key
      type  = "KEY_AND_VALUE"
      value = var.ec2_tag_value
    }
  }

  auto_scaling_groups = var.auto_scaling_groups

  trigger_configuration {
    trigger_name      = var.trigger_name
    trigger_target_arn = var.trigger_target_arn
    trigger_events    = var.trigger_events
  }

  alarm_configuration {
    enabled = var.alarm_enabled
