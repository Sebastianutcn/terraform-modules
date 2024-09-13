variable "application_name" {
  description = "Name of the Elastic Beanstalk application"
  type        = string
}

variable "application_description" {
  description = "Description of the Elastic Beanstalk application"
  type        = string
  default     = "Elastic Beanstalk application"
}

variable "environment_name" {
  description = "Name of the Elastic Beanstalk environment"
  type        = string
}

variable "solution_stack_name" {
  description = "The platform or solution stack for the environment, e.g., '64bit Amazon Linux 2 v3.1.2 running Node.js 14'"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type for Elastic Beanstalk instances"
  type        = string
  default     = "t2.micro"
}

variable "environment_type" {
  description = "The type of environment, either 'LoadBalanced' or 'SingleInstance'"
  type        = string
  default     = "LoadBalanced"
}

variable "environment_variables" {
  description = "Map of environment variables for the application"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "VPC ID to launch the Elastic Beanstalk environment into"
  type        = string
}

variable "ingress_from_port" {
  description = "Ingress rule: starting port"
  type        = number
  default     = 80
}

variable "ingress_to_port" {
  description = "Ingress rule: ending port"
  type        = number
  default     = 80
}

variable "ingress_protocol" {
  description = "Ingress rule: protocol"
  type        = string
  default     = "tcp"
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks allowed to connect to the instance"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}
