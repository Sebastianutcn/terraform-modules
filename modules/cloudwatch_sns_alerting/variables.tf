variable "sns_topic_name" {
  description = "The name of the SNS topic"
  type        = string
}

variable "sns_subscriptions" {
  description = "A map of SNS subscriptions (protocol and endpoint)"
  type        = map(object({
    protocol = string
    endpoint = string
  }))
}

variable "cloudwatch_alarms" {
  description = "A map of CloudWatch alarms to create"
  type = map(object({
    alarm_name                = string
    comparison_operator       = string
    evaluation_periods        = number
    metric_name               = string
    namespace                 = string
    period                    = number
    statistic                 = string
    threshold                 = number
    alarm_description         = string
    dimensions                = map(string)
    insufficient_data_actions = list(string)
    ok_actions                = list(string)
  }))
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}
