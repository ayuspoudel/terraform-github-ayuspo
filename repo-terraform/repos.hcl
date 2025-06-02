locals {
  terraform_repositories = {
    Terraform_best_methods = {
      name        = "terraform-best-methods"
      description = "Best practices in Terraform for modular design, dynamic blocks, remote backends, and scalable infrastructure as code."
      visibility  = "public"
      archived    = false
      topics      = ["terraform", "best-practices", "iac"]
    }

    terraform_github_ayuspo = {
      name        = "terraform-github-ayuspo"
      description = "Terraform module to manage GitHub repositories, collaborators, and configurations. Automates repo infrastructure as code."
      visibility  = "public"
      archived    = false
      topics      = ["terraform", "github", "automation"]
    }

    Terraform_Automation_Projects = {
      name        = "terraform-automation-Projects"
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
            