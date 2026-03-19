locals {
  tags = merge({
    Environment = var.environment,
    ManagedBy   = "rohanmatre",
    GitHubRepo  = "rohanmatre-terraform-wrappers"
  }, var.tags)
}
