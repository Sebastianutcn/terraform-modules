# AWS CodePipeline Module

This Terraform module creates an AWS CodePipeline with CodeCommit as the source, CodeBuild for the build stage, and CodeDeploy for the deploy stage.

## Usage

```hcl
module "codepipeline" {
  source = "./codepipeline"

  pipeline_name       = "my-codepipeline"
  pipeline_role_arn   = aws_iam_role.pipeline_role.arn
  artifact_bucket_name = "my-pipeline-artifacts-bucket"

  # CodeCommit settings
  codecommit_repo_name = "my-codecommit-repo"
  codecommit_branch    = "main"

  # CodeBuild settings
  build_project_name = "my-codebuild-project"
  codebuild_environment_variables = [
    {
      name  = "ENV"
      value = "production"
      type  = "PLAINTEXT"
    }
  ]
  build_spec = file("buildspec.yml")

  # CodeDeploy settings
  codedeploy_app_name              = "my-codedeploy-app"
  codedeploy_deployment_group_name = "my-deployment-group"
  codedeploy_service_role_arn      = aws_iam_role.codedeploy_role.arn

  tags = {
    Environment = "production"
    Project     = "example-project"
  }
}
