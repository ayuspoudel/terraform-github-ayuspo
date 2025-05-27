resource "github_repository" "this" {
  name        = var.name
  description = var.description
  visibility  = var.visibility
  homepage_url = var.homepage_url

  has_issues     = var.has_issues
  has_projects   = var.has_projects
  has_wiki       = var.has_wiki
  auto_init      = var.auto_init
  archived       = var.archived
  topics         = var.topics
  is_template    = var.is_template
}
