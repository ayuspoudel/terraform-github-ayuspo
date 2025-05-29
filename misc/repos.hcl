locals {
  misc_repositories = {
    profile_config = {
      name        = "ayuspoudel"
      description = "GitHub profile configuration with README and pinned repositories."
      visibility  = "public"
      archived    = false
      topics      = ["profile", "github", "readme"]
    }

    resume = {
      name        = "Resume"
      description = "My personal resume in various formats."
      visibility  = "private"
      archived    = false
      topics      = ["resume", "profile", "documents"]
    }
  }
}
