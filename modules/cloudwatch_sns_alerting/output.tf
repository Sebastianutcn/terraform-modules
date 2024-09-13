output "sns_topic_arn" {
  description = "The ARN of the SNS Topic"
  value       = aws_sns_topic.alarm_topic.arn
}

output "sns_topic_name" {
  description = "The name of the SNS Topic"
  value       = aws_sns_topic.alarm_topic.name
}

output "cloudwatch_alarm_names" {
  description = "List of CloudWatch Alarm names"
  value       = [for alarm in aws_cloudwatch_metric_alarm.cloudwatch_alarms : alarm.alarm_name]
}
