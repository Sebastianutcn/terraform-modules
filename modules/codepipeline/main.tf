# CodeCommit repository
resource "aws_codecommit_repository" "codecommit_repo" {
  repository_name = var.codecommit_repo_name
  description     = var.codecommit_repo_description

  tags = var.tags
}

# S3 Bucket for storing pipeline artifacts
resource "aws_s3_bucket" "pipeline_artifact_bucket" {
  bucket = var.artifact_bucket_name

  tags = var.tags
}

# CodePipeline
resource "aws_codepipeline" "pipeline" {
  name     = var.pipeline_name
  role_arn = var.pipeline_role_arn

  artifact_store {
    type     = "S3"
    location = aws_s3_bucket.pipeline_artifact_bucket.bucket
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeCommit"
      version          = "1"
      output_artifacts = ["source_output"]
      configuration = {
        RepositoryName = aws_codecommit_repository.codecommit_repo.repository_name
        BranchName     = var.codecommit_branch
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source_output"]
      output_artifacts = ["build_output"]
      configuration = {
        ProjectName = module.codebuild.project_name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name             = "Deploy"
      category         = "Deploy"
      owner            = "AWS"
      provider         = "CodeDeploy"
      version          = "1"
      input_artifacts  = ["build_output"]
      configuration = {
        ApplicationName     = module.codedeploy.codedeploy_app_name
        DeploymentGroupName = module.codedeploy.codedeploy_deployment_group_name
      }
    }
  }

  tags = var.tags
}

# Use the CodeBuild module
module "codebuild" {
  source = "../codebuild" # Adjust the path to where the CodeBuild module is located

  project_name = var.build_project_name
  environment_variables = var.codebuild_environment_variables
  build_spec = var.build_spec
  tags = var.tags
}

# Use the CodeDeploy module
module "codedeploy" {
  source = "../codedeploy" # Adjust the path to where the CodeDeploy module is located

  app_name              = var.codedeploy_app_name
  deployment_group_name = var.codedeploy_deployment_group_name
  service_role_arn      = var.codedeploy_service_role_arn
  deployment_config_name = var.codedeploy_deployment_config_name
  tags = var.tags
}
