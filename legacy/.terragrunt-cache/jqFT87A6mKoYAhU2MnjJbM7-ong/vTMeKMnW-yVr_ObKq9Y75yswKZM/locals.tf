locals {
  # Extract the first "prefix" style topic like terraform-, ansible-, etc.
  prefix = length([for t in var.topics : t if contains(["terraform", "ansible", "cloudformation", "dynatrace"], t)]) > 0 ? [for t in var.topics : t if contains(["terraform", "ansible", "cloudformation", "dynatrace"], t)][0]: "misc"

  # Generate a safe suffix based on description if name is not provided
  generated_suffix = var.description != null ? substr(replace(lower(var.description), "/[^a-z0-9]+/", "-"), 0, 30) : "untitled"

  # Final fallback name if var.name is not explicitly provided
  resolved_name = var.name != null && var.name != "" ? var.name : "${local.prefix}-${local.generated_suffix}"
}
