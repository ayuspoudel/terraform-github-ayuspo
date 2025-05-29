locals {
  ansible_repositories = {
    ansible_bootstrap = {
      name           = "ansible-windows-bootstrap"
      description    = "Bootstraps Windows instances using Ansible for configuration managent"
      visibility     = "public"
      archived       = false
      has_downloads  = true
      topics         = ["ansible", "windows", "automation"]
    }

    ansible_playbooks = {
      name           = "ansible-playbooks-common-devops"
      description    = "This repository features various Ansible playbooks for automating tasks and improving configuration management. Notable projects include automating passwordless authentication to AWS, managing AWS API configurations, and deploying web applications on EC2. Ideal for streamlining automation workflows." 
      visibility     = "public"
      archived       = false
      has_downloads  = true
      topics         = ["ansible", "playbooks", "automation"]
    }
  }
}
