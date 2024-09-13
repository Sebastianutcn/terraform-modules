# Create an Elastic Beanstalk application
resource "aws_elastic_beanstalk_application" "app" {
  name        = var.application_name
  description = var.application_description

  tags = var.tags
}

# Elastic Beanstalk Environment
resource "aws_elastic_beanstalk_environment" "env" {
  name                = var.environment_name
  application         = aws_elastic_beanstalk_application.app.name
  solution_stack_name = var.solution_stack_name

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_instance_profile.name
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = var.environment_type
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "ENV_VAR"
    value     = var.environment_variables
  }

  tags = var.tags
}

# Security Group for the Elastic Beanstalk Environment
resource "aws_security_group" "beanstalk_sg" {
  name        = "${var.application_name}-sg"
  description = "Elastic Beanstalk security group for ${var.application_name}"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = var.ingress_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.tags
}

