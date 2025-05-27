variable "name" {
  description = "The name of the GitHub repository"
  type        = string
}

variable "description" {
  description = "A short description of the repository"
  type        = string
  default     = ""
}

variable "visibility" {
  description = "Repository visibility: public or private"
  type        = string
  default     = "private"
}

variable "homepage_url" {
  description = "Optional homepage link"
  type        = string
  default     = null
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

variable "is_template" {
  description = "Whether this repo is a template"
  type        = bool
  default     = false
}

variable "auto_init" {
  description = "Initialize the repo with a README"
  type        = bool
  default     = true
}

variable "archived" {
  description = "Archive this repo"
  type        = bool
  default     = false
}

variable "topics" {
  description = "GitHub topics (tags)"
  type        = list(string)
  default     = []
}
