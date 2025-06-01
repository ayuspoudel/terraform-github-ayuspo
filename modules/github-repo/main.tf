resource "github_repository" "this" {
  for_each = var.repositories
 
  name               = each.value.name
  description        = each.value.description
  visibility         = each.value.visibility
  archived           = each.value.archived
  auto_init          = var.auto_init
  has_issues         = var.has_issues
  has_projects       = var.has_projects
  has_wiki           = var.has_wiki
  allow_squash_merge = var.allow_squash_merge
  allow_merge_commit = var.allow_merge_commit
  allow_rebase_merge = var.allow_rebase_merge
  topics             = each.value.topics

  security_and_analysis {
    secret_scanning {
      status = var.secret_scanning ? "enabled" : "disabled"
    }
    secret_scanning_push_protection {
      status = var.secret_scanning_push_protection ? "enabled" : "disabled"
    }
  }
}
terraform {
  backend "s3" {}
}

resource "github_actions_secret" "repo_secrets" {
  for_each = {
  for key in flatten([
    for repo_key, repo_secrets in var.secrets : [
      for secret_key, secret_value in repo_secrets : {
        composite_key = "${repo_key}__${secret_key}"
        repository    = repo_key
        secret_name   = secret_key
        secret_value  = secret_value
      }
    ]
  ]) : key.composite_key => key
}
  repository      = github_repository.this[each.value.repository].name
  secret_name     = each.value.secret_name
  plaintext_value = each.value.secret_value
}


