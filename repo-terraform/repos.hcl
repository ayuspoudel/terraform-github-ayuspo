locals {
  terraform_repositories = {
    best_methods = {
      name        = "Terraform-best-methods"
      description = "Best practices in Terraform for modular design, dynamic blocks, remote backends, and scalable infrastructure as code."
      visibility  = "public"
      archived    = false
      topics      = ["terraform", "best-practices", "iac"]
    }

    github_management = {
      name        = "terraform-github-ayuspo"
      description = "Terraform module to manage GitHub repositories, collaborators, and configurations. Automates repo infrastructure as code."
      visibility  = "public"
      archived    = false
      topics      = ["terraform", "github", "automation"]
    }

    automation_projects = {
      name        = "Terraform-Automation-Projects"
      description = "Terraform configurations for automating AWS infrastructure tasks. Includes EC2 provisioning, IAM policies, and networking."
      visibility  = "public"
      archived    = false
      topics      = ["terraform", "automation", "aws"]
    }

    oidc_auth  = {
      name               = "terraform-oidc-authentication-manager"
      description        = "Terraform configurations for managing AWS IAM roles and OIDC trust policies for secure authentication across external identity providers such as GitHub Actions, CI/CD systems, or federated applications. Designed for centralized, reusable, and least-privilege access control."
      visibility         = "public"
      archived           = false
      topics             = ["terraform", "aws", "iam", "oidc", "authentication", "access-control"]
      auto_init          = true
      license_template   = "mit"
      gitignore_template = "Terraform"
  

    }
  }
}
                   