locals {  
    developed_applications_secrets = yamldecode(file("${get_terragrunt_dir()}/secrets.yaml"))    
}