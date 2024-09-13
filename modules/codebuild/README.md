# AWS CodeBuild Project Module

This Terraform module creates an AWS CodeBuild project.

## Usage

```hcl
module "codebuild_project" {
  source = "./codebuild_project"

  project_name          = "my-codebuild-project"
  service_role_arn      = aws_iam_role.codebuild_role.arn
  service_role_name     = aws_iam_role.codebuild_role.name
  compute_type          = "BUILD_GENERAL1_SMALL"
  environment_image     = "aws/codebuild/standard:5.0"
  environment_variables = [
    {
      name  = "ENVIRONMENT"
      value = "prod"
      type  = "PLAINTEXT"
    }
  ]
  source_type           = "GITHUB"
  source_location       = "https://github.com/my-repo/my-project.git"
  buildspec             = "buildspec.yml"
  git_clone_depth       = 1
  cloudwatch_log_group  = "/aws/codebuild/my-codebuild-project"
  cloudwatch_log_stream = "build-log-stream"
  s3_log_location       = "s3://my-bucket/logs"
  
  tags = {
    Environment = "prod"
    Project     = "my-codebuild-project"
  }
}
