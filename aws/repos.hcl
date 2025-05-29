locals {
  aws_repositories = {
    aws_notes = {
      name        = "AWS-Notes"
      description = "Organized notes on various AWS services like VPC, EC2, S3, IAM, and more."
      visibility  = "public"
      archived    = false
      topics      = ["aws", "notes", "cloud"]
    }

    aws_scripting = {
      name        = "AWS-Scripting"
      description = "Reusable CLI scripts to create, delete, list, and connect various AWS resources."
      visibility  = "public"
      archived    = false
      topics      = ["aws", "cli", "scripts"]
    }

    aws_three_tier = {
      name        = "AWS-Three-Tier-Web-Architecture"
      description = "Robust three-tier web architecture deployed on AWS using services like ALB, EC2, and RDS."
      visibility  = "public"
      archived    = false
      topics      = ["aws", "architecture", "three-tier"]
    }

    end_to_end_devops = {
      name        = "end-to-end-devops-microservices"
      description = "End-to-end DevOps project with IaC, CI/CD, container orchestration, and monitoring."
      visibility  = "public"
      archived    = false
      topics      = ["aws", "devops", "microservices"]
    }

    serverless_github_jira = {
      name        = "serverless-github-jira-automation"
      description = "Serverless backend to automate Jira ticket creation from GitHub issues using Python and AWS."
      visibility  = "public"
      archived    = false
      topics      = ["aws", "serverless", "automation"]
    }

    cloud_iac_monorepo = {
      name        = "cloud-iac-monorepo"
      description = "Monorepo with Terraform configurations and reusable modules for personal cloud projects."
      visibility  = "public"
      archived    = false
      topics      = ["aws", "iac", "terraform"]
    }
  }
}
