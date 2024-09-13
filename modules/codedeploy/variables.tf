variable "app_name" {
  description = "The name of the CodeDeploy application"
  type        = string
}

variable "compute_platform" {
  description = "The compute platform for CodeDeploy (e.g., EC2 or Lambda)"
  type        = string
  default     = "Server"
}

variable "deployment_group_name" {
  description = "The name of the CodeDeploy deployment group"
  type        = string
}

variable "service_role_arn" {
  description = "The ARN of the IAM role for CodeDeploy"
  type        = string
}

variable "deployment_config_name" {
  description = "The name of the deployment configuration"
  type        = string
  default     = "CodeDeployDefault.OneAtATime"
}

variable "auto_rollback_enabled" {
  description = "Enable auto rollback on deployment failure"
  type        = bool
  default     = true
}

variable "auto_rollback_events" {
  description = "The events that trigger auto rollback (e.g., DEPLOYMENT_FAILURE)"
  type        = list(string)
  default     = ["DEPLOYMENT_FAILURE"]
}

variable "deployment_type" {
  description = "The type of deployment (e.g., BLUE_GREEN or IN_PLACE)"
  type        = string
  default     = "IN_PLACE"
}

variable "deployment_option" {
  description = "The deployment option (e.g., WITH_TRAFFIC_CONTROL, WITHOUT_TRAFFIC_CONTROL)"
  type        = string
  default     = "WITHOUT_TRAFFIC_CONTROL"
}

variable "elb_name" {
  description = "The name of the Elastic Load Balancer to use for CodeDeploy"
  type        = string
  default     = ""
}

variable "ec2_tag_key" {
  description = "The EC2 tag key to filter instances for CodeDeploy"
  type        = string
  default     = ""
}

variable "ec2_tag_value" {
  description = "The EC2 tag value to filter instances for CodeDeploy"
  type        = string
  default     = ""
}

variable "auto_scaling_groups" {
  description = "A list of auto-scaling groups to include in the deployment group"
  type        = list(string)
  default     = []
}

variable "trigger_name" {
  description = "The name of the trigger for CodeDeploy events"
  type        = string
  default     = ""
}

variable "trigger_target_arn" {
  description = "The ARN of the trigger target for CodeDeploy events"
  type        = string
  default     = ""
}

variable "trigger_events" {
  description = "The list of events that trigger the notification (e.g., DeploymentSuccess)"
  type        = list(string)
  default     = ["DeploymentSuccess", "DeploymentFailure"]
}

variable "alarm_enabled" {
  description = "Enable alarm configuration"
  type        = bool
  default     = false
}

variable "alarms" {
  description = "The list of CloudWatch alarms associated with the deployment group"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}
