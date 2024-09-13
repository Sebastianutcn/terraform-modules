# Create SNS Topic for sending alerts
resource "aws_sns_topic" "alarm_topic" {
  name = var.sns_topic_name
  tags = var.tags
}

# Create SNS Subscriptions for receiving alerts
resource "aws_sns_topic_subscription" "sns_subscription" {
  for_each = var.sns_subscriptions

  topic_arn = aws_sns_topic.alarm_topic.arn
  protocol  = each.value["protocol"]
  endpoint  = each.value["endpoint"]
}

# Create CloudWatch Alarms
resource "aws_cloudwatch_metric_alarm" "cloudwatch_alarms" {
  for_each = var.cloudwatch_alarms

  alarm_name                = each.value["alarm_name"]
  comparison_operator       = each.value["comparison_operator"]
  evaluation_periods        = each.value["evaluation_periods"]
  metric_name               = each.value["metric_name"]
  namespace                 = each.value["namespace"]
  period                    = each.value["period"]
  statistic                 = each.value["statistic"]
  threshold                 = each.value["threshold"]
  alarm_description         = each.value["alarm_description"]
  dimensions                = each.value["dimensions"]
  alarm_actions             = [aws_sns_topic.alarm_topic.arn]
  insufficient_data_actions = each.value["insufficient_data_actions"]
  ok_actions                = each.value["ok_actions"]
}
