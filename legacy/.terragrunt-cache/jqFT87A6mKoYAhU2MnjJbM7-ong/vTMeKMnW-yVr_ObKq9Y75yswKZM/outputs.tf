output "repository_name" {
  value = github_repository.this.name
}

output "repository_url" {
  value = github_repository.this.html_url
}

output "repository_id" {
  value = github_repository.this.node_id
}
