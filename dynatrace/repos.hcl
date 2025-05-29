locals {
  dynatrace_repositories = {
    dynatrace_hybrid_monaco = {
      name        = "dynatrace-terraform-observability-dashboards"
      description = "Terraform module to provision application reliability and availability dashboards in Dynatrace environments. Includes Monaco 2.0 definitions and DQL-based custom tile queries."
      visibility  = "public"
      archived    = false
      has_downloads               = true
      topics      = ["dynatrace", "terraform", "observability", "dashboards"]
    }
  }
}
