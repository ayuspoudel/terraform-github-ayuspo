locals {
  ops_repositories = {
    # observability_zero_to_hero = {
    #   name        = "ops-observability-zero-to-hero"
    #   description = "Learning repository to explore observability tools, practices, and real-world use cases for monitoring and alerting."
    #   visibility  = "public"
    #   archived    = false
    #   topics      = ["observability", "monitoring", "ops"]
    # }

    # vm_health_check = {
    #   name        = "ops-vm-health-check"
    #   description = "A lightweight script to monitor and assess virtual machine health metrics. Useful in cloud operations workflows."
    #   visibility  = "private"
    #   archived    = false
    #   has_downloads               = true
    #   topics      = ["vm", "health-check", "monitoring", "ops"]
    # }

    shell_scripting_projects = {
      name        = "ops-shell-scripting-automation"
      description = "A collection of advanced shell scripting projects, ranging from basic automation tasks to complex system operations. Each project includes detailed explanations and example scripts to help users enhance their scripting skills. Ideal for both beginners and experienced shell scripters."
      visibility  = "public"
      archived    = false
      has_downloads               = true
      topics      = ["shell", "scripting", "automation", "ops"]
    }

    cicd_pipeline_jenkins_argocd = {
      name        = "ops-cicd-pipeline-jenkins-argocd-k8s"
      description = "Demonstration of end-to-end CI/CD pipeline using Jenkins, ArgoCD, and Kubernetes for automated deployments and GitOps workflows."
      visibility  = "public"
      has_downloads               = true
      archived    = false
      topics      = ["cicd", "jenkins", "argocd", "kubernetes", "ops"]
    }

    kubernetes_demo_app = {
      name        = "ops-kubernetes-demo-application"
      description = "Sample Kubernetes application deployment for learning container orchestration, manifests, and Helm charts."
      visibility  = "public"
      archived    = false
      has_downloads               = true
      topics      = ["kubernetes", "devops", "ops"]
    }

    python_utilities = {
      name        = "ops-python-infra-utilities"
      description = "Various Python-based utilities and automation scripts used across devops, scripting, and infrastructure management."
      visibility  = "public"
      archived    = false
      has_downloads               = true
      topics      = ["python", "automation", "utilities", "ops"]
    }
  }
}
