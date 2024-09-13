output "pipeline_name" {
  description = "The name of the CodePipeline"
  value       = aws_codepipeline.pipeline.name
}

output "codecommit_repo_name" {
  description = "The name of the CodeCommit repository"
  value       = aws_codecommit_repository.codecommit_repo.repository_name
}

output "artifact_bucket_name" {
  description = "The name of the S3 bucket for pipeline artifacts"
  value       = aws_s3_bucket.pipeline_artifact_bucket.bucket
}
