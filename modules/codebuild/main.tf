resource "aws_codebuild_project" "codebuild" {
  name           = var.project_name
  service_role   = var.service_role_arn
  description    = var.description
  build_timeout  = var.build_timeout
  artifacts {
    type = var.artifact_type
    location = var.artifact_location
  }

  environment {
    compute_type                = var.compute_type
    image                       = var.environment_image
    type                        = var.environment_type
    environment_variables       = var.environment_variables
    privileged_mode             = var.privileged_mode
  }

  source {
    type            = var.source_type
    location        = var.source_location
    buildspec       = var.buildspec
    git_clone_depth = var.git_clone_depth
  }

  logs_config {
    cloudwatch_logs {
      group_name = var.cloudwatch_log_group
      stream_name = var.cloudwatch_log_stream
    }
    s3_logs {
      status   = "ENABLED"
      location = var.s3_log_location
    }
  }

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "codebuild_role_policy" {
  role       = var.service_role_name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeBuildAdminAccess"
}
