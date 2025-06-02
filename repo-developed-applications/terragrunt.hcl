include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  root_config    = read_terragrunt_config(find_in_parent_folders("root.hcl"))
  repos_config   = read_terragrunt_config("${get_terragrunt_dir()}/repos.hcl")
  secrets_config = read_terragrunt_config("${get_terragrunt_dir()}/secrets.hcl")
  secrets      = local.secrets_config.locals.developed_applications_secrets
  common_inputs        = local.root_config.locals.common_inputs
  developed_applications_repositories = local.repos_config.locals.developed_applications_repositories
}

terraform {
  source = "../modules/github-repo"
}

inputs = merge(
  local.common_inputs,
  {
    repositories = local.developed_applications_repositories
    secrets = local.secrets
  }
)