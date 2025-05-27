variable "repositories" {
  description = "Map of GitHub repositories to create"
  type = map(object({
    name        = string
    description = string
    visibility  = string
    archived    = bool
    topics      = list(string)
  }))
}

variable "has_issues" {
  type    = bool
  default = true
}

variable "has_projects" {
  type    = bool
  default = true
}

variable "has_wiki" {
  type    = bool
  default = true
}

variable "auto_init" {
  type    = bool
  default = true
}

variable "allow_squash_merge" {
  type    = bool
  default = true
}

variable "allow_merge_commit" {
  type    = bool
  default = true
}

variable "allow_rebase_merge" {
  type    = bool
  default = true
}

variable "secret_scanning" {
  type    = bool
  default = true
}

variable "secret_scanning_push_protection" {
  type    = bool
  default = true
}
