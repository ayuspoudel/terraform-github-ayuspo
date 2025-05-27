variable "name" {
  description = "Name of the GitHub repository (use prefix like terraform-, ansible-, etc.)"
  type        = string
}

variable "description" {
  description = "Short description of the GitHub repository"
  type        = string
}

variable "visibility" {
  description = "Repository visibility: public or private"
  type        = string
}

variable "archived" {
  description = "Whether the repository is archived"
  type        = bool
}

variable "topics" {
  description = "Topics/tags to associate with the repository (internal + public)"
  type        = list(string)
  default     = []
}

variable "auto_init" {
  description = "Whether to auto-initialize the repository with a README"
  type        = bool
  default     = true
}

variable "has_issues" {
  description = "Enable GitHub Issues"
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "Enable GitHub Projects"
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Enable GitHub Wiki"
  type        = bool
  default     = false
}

variable "allow_squash_merge" {
  description = "Allow squash merges"
  type        = bool
  default     = true
}

variable "allow_merge_commit" {
  description = "Allow merge commits"
  type        = bool
  default     = true
}

variable "allow_rebase_merge" {
  description = "Allow rebase merges"
  type        = bool
  default     = true
}

variable "secret_scanning" {
  description = "Enable secret scanning"
  type        = bool
  default     = true
}

variable "secret_scanning_push_protection" {
  description = "Enable secret scanning push protection"
  type        = bool
  default     = true
}

