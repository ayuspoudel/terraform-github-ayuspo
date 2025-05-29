locals {
  dynatrace_repositories = {
    hybrid_monaco = {
      name        = "dynatrace-hybrid-monaco"
      description = "Terraform module to provision application reliability and availability dashboards in Dynatrace environments. Includes Monaco 2.0 definitions and DQL-based custom tile queries."
      visibility  = "public"
      archived    = false
      topics      = ["dynatrace", "terraform", "observability", "dashboards"]
    }
  }
}
