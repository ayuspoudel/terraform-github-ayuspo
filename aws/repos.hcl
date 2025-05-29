locals {
  aws_repositories = {
    aws_notes = {
      name        = "aws-service-notes"
      description = "Organized and structured notes on AWS core services like EC2, IAM, S3, VPC, and more — ideal for certification prep or internal knowledge base."
      visibility  = "public"
      archived    = false
      has_downloads = true
      topics      = ["aws", "notes", "learning", "services"]
    }

    aws_scripting = {
      name        = "aws-cli-automation-scripts"
      description = "Reusable CLI-based scripts to create, delete, and manage AWS resources efficiently. Focused on practical cloud automation."
      visibility  = "public"
      archived    = false
      has_downloads = true
      topics      = ["aws", "cli", "automation", "scripts"]
    }

    aws_three_tier = {
      name        = "aws-3tier-web-architecture"
      description = "designed and implemented a robust three-tier web architecture on AWS, utilizing a comprehensive suite of AWS services to achieve scalability, security, and high availability"
      visibility  = "public"
      archived    = false
      has_downloads = true
      topics      = ["aws", "architecture", "three-tier", "ec2", "rds", "vpc", "alb"]
    }

    end_to_end_devops = {
      name        = "aws-cloud-native-microservices-deployment"
      description = "End-to-end devops implementation with IaC, Automation, Containerization and Orchestration for an open source open telemetry e-commerce application"
      visibility  = "public"
      archived    = false
      has_downloads = true
      topics      = ["aws", "kubernetes", "microservices", "devops", "cicd", "monitoring", "terraform"]
    }

    serverless_github_jira = {
      name        = "aws-lambda-serverless-jira-github-sync"
      description = "Event-driven AWS Lambda project to automate Jira issue creation from GitHub events using a fully serverless architecture."
      visibility  = "public"
      archived    = false
      has_downloads = true
      topics      = ["aws", "lambda", "serverless", "jira", "github", "automation"]
    }

    cloud_iac_monorepo = {
      name        = "aws-iac-terraform-monorepo"
      description = "It contains my personal projects' Infrastructure Definition as Code in HCL with reusable modules defined for AWS resources used in the projects. It uses terraform workspaces to separate the projects, the workspace name reflects an actual repo name in this account. Contributions are welcomed :)"
      visibility  = "public"
      archived    = false
      has_downloads = true
      topics      = ["aws", "terraform", "iac", "modules", "devops"]
    }
    aws_mongodb_cluster = {
      name        = "aws-mongodb-ha-replicaset-cluster"
      description = "A end-to-end terraform + ansible script to deploy highly scalable, persistent, self healing HA MongoDB cluster"
      visibility  = "public"
      archived    = false
      has_downloads = true
      topics      = ["aws", "mongodb", "high-availability", "ecs", "replica-set", "database"]
    }
  }
}
