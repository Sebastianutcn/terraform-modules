variable "pipeline_name" {
  description = "The name of the CodePipeline"
  type        = string
}

variable "pipeline_role_arn" {
  description = "The ARN of the IAM role that CodePipeline will use"
  type        = string
}

variable "artifact_bucket_name" {
  description = "The name of the S3 bucket for pipeline artifacts"
  type        = string
}

# CodeCommit variables
variable "codecommit_repo_name" {
  description = "The name of the CodeCommit repository"
  type        = string
}

variable "codecommit_repo_description" {
  description = "The description of the CodeCommit repository"
  type        = string
  default     = ""
}

variable "codecommit_branch" {
  description = "The branch to pull from the CodeCommit repository"
  type        = string
  default     = "main"
}

# CodeBuild variables
variable "build_project_name" {
  description = "The name of the CodeBuild project"
  type        = string
}

variable "codebuild_environment_variables" {
  description = "A list of environment variables for CodeBuild"
  type        = list(object({
    name  = string
    value = string
    type  = string
  }))
  default = []
}

variable "build_spec" {
  description = "The build spec file for the CodeBuild project"
  type        = string
  default     = ""
}

# CodeDeploy variables
variable "codedeploy_app_name" {
  description = "The name of the CodeDeploy application"
  type        = string
}

variable "codedeploy_deployment_group_name" {
  description = "The name of the CodeDeploy deployment group"
  type        = string
}

variable "codedeploy_service_role_arn" {
  description = "The ARN of the IAM role for CodeDeploy"
  type        = string
}

variable "codedeploy_deployment_config_name" {
  description = "The name of the deployment configuration for CodeDeploy"
  type        = string
  default     = "CodeDeployDefault.OneAtATime"
}

# Tags
variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {}
}
