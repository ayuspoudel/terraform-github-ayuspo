locals {
  developed_applications_repositories = {
    dotmanz = {
      name        = "dmz"
      description = "A modular ZSH dotfiles framework and CLI toolkit that turns your terminal setup into a clean, maintainable, and self-documenting shell environment. Designed to be beginner-friendly, extensible, and version-controlled."
      visibility  = "public"
      archived    = false
      topics      = ["zsh", "dotfiles", "cli", "developer-tools"]
    }

    homebrew_dotmanz = {
      name        = "homebrew-dmz"
      description = "Homebrew tap for installing the dmz CLI — modular ZSH configuration toolkit."
      visibility  = "public"
      archived    = false
      topics      = ["homebrew", "dotfiles", "zsh", "cli"]
    }
  }
}