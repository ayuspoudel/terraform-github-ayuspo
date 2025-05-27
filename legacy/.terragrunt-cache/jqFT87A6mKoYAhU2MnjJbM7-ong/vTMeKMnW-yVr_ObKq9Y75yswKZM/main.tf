resource "github_repository" "this" {
  name               = var.name
  description        = var.description
  visibility         = var.visibility
  archived           = var.archived
  auto_init          = var.auto_init
  has_issues         = var.has_issues
  has_projects       = var.has_projects
  has_wiki           = var.has_wiki
  allow_squash_merge = var.allow_squash_merge
  allow_merge_commit = var.allow_merge_commit
  allow_rebase_merge = var.allow_rebase_merge
  topics             = var.topics

  security_and_analysis {
    secret_scanning {
      status = var.secret_scanning ? "enabled" : "disabled"
    }
    secret_scanning_push_protection {
      status = var.secret_scanning_push_protection ? "enabled" : "disabled"
    }
  }
}
