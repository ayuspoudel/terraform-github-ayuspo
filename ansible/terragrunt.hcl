include "root" {
  path = find_in_parent_folders("root.hcl")
}

locals {
  root_config    = read_terragrunt_config(find_in_parent_folders("root.hcl"))
  repos_config   = read_terragrunt_config("${get_terragrunt_dir()}/repos.hcl")

  common_inputs        = local.root_config.locals.common_inputs
  ansible_repositories = local.repos_config.locals.ansible_repositories
}

terraform {
  source = "../modules/github-repo"
}

inputs = merge(
  local.common_inputs,
  {
    repositories = local.ansible_repositories
  }
)
