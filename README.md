# Terraform AWS Modules
This repository contains reusable and customizable Terraform modules for setting up and managing various AWS resources. These modules are designed to simplify the provisioning and configuration of key infrastructure components for AWS environments, including VPC, EC2 instances, CI/CD pipelines, monitoring dashboards, alerting mechanisms, Elastic Beanstalk environments and RDS (Relational Database Service) instances.

## Modules Overview
### VPC Module
- This module provisions a fully customizable AWS VPC (Virtual Private Cloud) with public and private subnets, route tables, internet gateways, NAT gateways, and security groups.

### EC2 Module
- This module provisions EC2 instances with support for security groups, SSH key pairs, user data scripts, and instance roles.

### CodeBuild Module
- This module provisions AWS CodeBuild projects, allowing you to automate your build and test processes as part of a CI/CD pipeline.

### CodeDeploy Module
- This module provisions AWS CodeDeploy resources, enabling automated deployments of applications to EC2 instances, Lambda, or ECS.

### CodePipeline Module
- This module provisions AWS CodePipeline resources, integrating CodeCommit (source), CodeBuild (build), and CodeDeploy (deploy) stages for automated CI/CD.

### CloudWatch Dashboard Module
- This module creates a CloudWatch dashboard with customizable widgets to monitor various AWS resources, such as EC2, RDS, ECS, and Lambda.

### CloudWatch SNS Alerting Module
- This module sets up CloudWatch alarms to monitor specific metrics and integrates with Amazon SNS for sending notifications via email, SMS, or Lambda functions.

### Elastic Beanstalk Module
- This module provisions an AWS Elastic Beanstalk environment, which is a platform-as-a-service (PaaS) for deploying and managing applications. It supports configurable parameters like application name, solution stack, environment type, scaling policies, and environment variables.

### RDS Module
- This module provisions an Amazon RDS instance, a fully managed relational database service.