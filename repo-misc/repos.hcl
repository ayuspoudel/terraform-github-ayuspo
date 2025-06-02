locals {
  misc_repositories = {
    ayuspo_resume = {
      name        = "ayuspoudel-resume"
      description = "My personal resume in various formats."
      visibility  = "private"
      archived    = false
      topics      = ["resume", "profile", "documents","config","github-config"]
    }

    profile_config = {
      name        = "ayuspoudel"
      description = "GitHub profile configuration with README and pinned repositories."
      visibility  = "public"
      archived    = false
      topics      = ["profile", "github", "readme"]
    }
  }
}

