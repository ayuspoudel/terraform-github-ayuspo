terraform {
  source = "../modules/github-repo"
}

locals {
  defaults = {
    visibility         = "public"
    archived           = false
    auto_init          = true
    has_issues         = true
    has_projects       = true
    has_wiki           = true
    allow_squash_merge = true
    allow_merge_commit = true
    allow_rebase_merge = true
    secret_scanning    = true
    secret_scanning_push_protection = true
    topics             = ["legacy"]
  }
}

inputs = merge(
  local.defaults,
  {
    name        = "cpp-library-adt-dsa"
    description = "C++, HPP, and EXE files for various ADTs and Data Structures"
    topics      = concat(local.defaults.topics, ["cpp", "adt", "data-structures"])
  }
)
