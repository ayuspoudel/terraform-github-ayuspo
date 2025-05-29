locals {
  ops_repositories = {
    observability_zero_to_hero = {
      name        = "observability-zero-to-hero"
      description = "Learning repository to explore observability tools, practices, and real-world use cases for monitoring and alerting."
      visibility  = "public"
      archived    = false
      topics      = ["observability", "monitoring", "ops"]
    }

    vm_health_check = {
      name        = "vm-health-check"
      description = "A lightweight script to monitor and assess virtual machine health metrics. Useful in cloud operations workflows."
      visibility  = "private"
      archived    = false
      topics      = ["vm", "health-check", "monitoring", "ops"]
    }

    shell_scripting_projects = {
      name        = "Shell-Scripting-Projects"
      description = "Advanced shell scripting projects for automation and systems operations, ranging from cron jobs to custom monitoring tools."
      visibility  = "public"
      archived    = false
      topics      = ["shell", "scripting", "automation", "ops"]
    }

        cicd_pipeline_jenkins_argocd = {
      name        = "CICD-Pipeline-Implementation-Jenkins-ArgoCD-Kubernetes"
      description = "Demonstration of end-to-end CI/CD pipeline using Jenkins, ArgoCD, and Kubernetes for automated deployments and GitOps workflows."
      visibility  = "public"
      archived    = false
      topics      = ["cicd", "jenkins", "argocd", "kubernetes", "ops"]
    }

    kubernetes_demo_app = {
      name        = "kubernetes-demo-app"
      description = "Sample Kubernetes application deployment for learning container orchestration, manifests, and Helm charts."
      visibility  = "public"
      archived    = false
      topics      = ["kubernetes", "devops", "ops"]
    }

    python_utilities = {
      name        = "Python"
      description = "Various Python-based utilities and automation scripts used across devops, scripting, and infrastructure management."
      visibility  = "public"
      archived    = false
      topics      = ["python", "automation", "utilities", "ops"]
    }

  }
}
