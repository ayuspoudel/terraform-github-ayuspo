locals {
  ansible_repositories = {
    ansible_bootstrap = {
      name        = "Ansible-Windows-Bootstrap"
      description = "Bootstraps Windows instances using Ansible for configuration management and software provisioning."
      visibility  = "public"
      archived    = false
      topics      = ["ansible", "windows", "automation"]
    }

    ansible_playbooks = {
      name        = "Ansible-Playbook-Projects"
      description = "A collection of Ansible playbooks for automating common infrastructure tasks and service setups."
      visibility  = "public"
      archived    = false
      topics      = ["ansible", "playbooks", "automation"]
    }
  }
}
