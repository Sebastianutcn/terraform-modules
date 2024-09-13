variable "project_name" {
  description = "The name of the CodeBuild project"
  type        = string
}

variable "description" {
  description = "The description of the CodeBuild project"
  type        = string
  default     = "A CodeBuild project"
}

variable "service_role_arn" {
  description = "The ARN of the IAM role for CodeBuild"
  type        = string
}

variable "service_role_name" {
  description = "The name of the IAM role for CodeBuild"
  type        = string
}

variable "build_timeout" {
  description = "The number of minutes before timing out any build"
  type        = number
  default     = 60
}

variable "artifact_type" {
  description = "The type of build artifacts. Valid values: CODEPIPELINE, NO_ARTIFACTS, S3"
  type        = string
  default     = "CODEPIPELINE"
}

variable "artifact_location" {
  description = "The location where build artifacts will be stored"
  type        = string
  default     = ""
}

variable "compute_type" {
  description = "The type of compute environment used for builds. Valid values: BUILD_GENERAL1_SMALL, BUILD_GENERAL1_MEDIUM, BUILD_GENERAL1_LARGE"
  type        = string
  default     = "BUILD_GENERAL1_SMALL"
}

variable "environment_image" {
  description = "The Docker image used for the build environment"
  type        = string
  default     = "aws/codebuild/standard:5.0"
}

variable "environment_type" {
  description = "The environment type for the build (e.g., LINUX_CONTAINER)"
  type        = string
  default     = "LINUX_CONTAINER"
}

variable "privileged_mode" {
  description = "Enable privileged mode to allow the build to run Docker commands"
  type        = bool
  default     = false
}

variable "environment_variables" {
  description = "List of environment variables to pass to the build"
  type        = list(object({
    name  = string
    value = string
    type  = string  # Valid values: 'PLAINTEXT', 'PARAMETER_STORE', or 'SECRETS_MANAGER'
  }))
  default = []
}

variable "source_type" {
  description = "The type of source (e.g., CODEPIPELINE, GITHUB, S3)"
  type        = string
  default     = "CODEPIPELINE"
}

variable "source_location" {
  description = "The location of the source code (if applicable)"
  type        = string
  default     = ""
}

variable "buildspec" {
  description = "The path to the buildspec.yml file (if applicable)"
  type        = string
  default     = ""
}

variable "git_clone_depth" {
  description = "The number of Git history versions to clone"
  type        = number
  default     = 1
}

variable "cloudwatch_log_group" {
  description = "The CloudWatch Logs group to store build logs"
  type        = string
  default     = "/aws/codebuild"
}

variable "cloudwatch_log_stream" {
  description = "The CloudWatch Logs stream to store build logs"
  type        = string
  default     = ""
}

variable "s3_log_location" {
  description = "The S3 location to store build logs"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}
