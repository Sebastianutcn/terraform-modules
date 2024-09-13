variable "dashboard_name" {
  description = "The name of the CloudWatch dashboard"
  type        = string
}

variable "widgets" {
  description = "A list of widgets to include in the CloudWatch dashboard"
  type        = list(any)
}

variable "tags" {
  description = "A map of tags to assign to the dashboard"
  type        = map(string)
  default     = {}
}
