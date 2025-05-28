locals {
  region         = "us-east-1"
  bucket         = "terraform-backend-ayush-bucket"
  dynamodb_table = "terraform-backend-ayush-locks"

  common_inputs = {
    github_token                     = "REPLACE_ME"
    has_issues                       = true
    has_projects                     = true
    has_wiki                         = true
    auto_init                        = true
    allow_squash_merge               = true
    allow_merge_commit               = true
    allow_rebase_merge               = true
    secret_scanning                  = true
    secret_scanning_push_protection = true
    github_token = get_env("TF_VAR_github_token", "override-if-needed")
  }
}

remote_state {
  backend = "s3"
  config = {
    bucket         = local.bucket
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = local.region
    encrypt        = true
    dynamodb_table = local.dynamodb_table
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "github" {
  token = var.github_token
  owner = "ayuspoudel"
}
EOF
}
