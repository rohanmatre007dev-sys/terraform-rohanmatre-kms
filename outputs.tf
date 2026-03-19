output "aliases" {
  description = "Map of aliases created"
  value       = module.kms.aliases
}

output "external_key_expiration_model" {
  description = "Expiration model of external key material"
  value       = module.kms.external_key_expiration_model
}

output "external_key_state" {
  description = "State of external key"
  value       = module.kms.external_key_state
}

output "external_key_usage" {
  description = "Usage (cryptographic operations) of external key"
  value       = module.kms.external_key_usage
}

output "grants" {
  description = "Map of grants created"
  value       = module.kms.grants
  sensitive   = true
}

output "key_arn" {
  description = "ARN of the KMS key"
  value       = module.kms.key_arn
}

output "key_id" {
  description = "KMS key ID"
  value       = module.kms.key_id
}

output "key_policy" {
  description = "KMS key policy JSON"
  value       = module.kms.key_policy
}

output "key_region" {
  description = "Region of the KMS key"
  value       = module.kms.key_region
}
