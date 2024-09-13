# IAM Role for Elastic Beanstalk EC2 instances
resource "aws_iam_role" "beanstalk_instance_role" {
  name = "${var.application_name}-instance-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      }
    }]
  })

  tags = var.tags
}

# IAM Policy for Elastic Beanstalk EC2 instances
resource "aws_iam_role_policy_attachment" "beanstalk_ec2_policy" {
  role       = aws_iam_role.beanstalk_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkWebTier"
}

resource "aws_iam_role_policy_attachment" "beanstalk_s3_policy" {
  role       = aws_iam_role.beanstalk_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkS3Role"
}

# Instance profile for EC2 instances in Beanstalk
resource "aws_iam_instance_profile" "beanstalk_instance_profile" {
  name = "${var.application_name}-instance-profile"
  role = aws_iam_role.beanstalk_instance_role.name
}

# IAM Service Role for Elastic Beanstalk
resource "aws_iam_role" "beanstalk_service_role" {
  name = "${var.application_name}-service-role"

  assume_role_policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [{
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "elasticbeanstalk.amazonaws.com"
      }
    }]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "beanstalk_service_policy" {
  role       = aws_iam_role.beanstalk_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSElasticBeanstalkEnhancedHealth"
}
