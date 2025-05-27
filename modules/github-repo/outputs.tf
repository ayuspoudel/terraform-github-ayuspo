

output "repositories" {
  value = {
    for k, repo in github_repository.this :
    k => {
      name = repo.name
      url  = repo.html_url
      id   = repo.node_id
    }
  }
}
