################################################################################
# terraform-rohanmatre-kms variables
################################################################################

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "stage", "prod"], var.environment)
    error_message = "Environment must be one of: dev, stage, prod."
  }
}

variable "region" {
  description = "AWS region where KMS resources are managed"
  type        = string
  # default     = "ap-south-1"
}

variable "create" {
  description = "Determines whether resources will be created"
  type        = bool
  default     = true
}

variable "create_external" {
  description = "Create external CMK with provided key material"
  type        = bool
  default     = false
}

variable "create_replica" {
  description = "Create a replica standard CMK"
  type        = bool
  default     = false
}

variable "create_replica_external" {
  description = "Create a replica external CMK"
  type        = bool
  default     = false
}

variable "description" {
  description = "KMS key description"
  type        = string
  default     = null
}

variable "key_usage" {
  description = "Intended use of the key (ENCRYPT_DECRYPT or SIGN_VERIFY)"
  type        = string
  default     = null
}

variable "is_enabled" {
  description = "Whether the key is enabled"
  type        = bool
  default     = null
}

variable "multi_region" {
  description = "Whether the key is multi-region"
  type        = bool
  default     = false
}

variable "enable_key_rotation" {
  description = "Whether key rotation is enabled"
  type        = bool
  default     = true
}

variable "deletion_window_in_days" {
  description = "Scheduled deletion window in days (7-30)"
  type        = number
  default     = null
}

variable "enable_default_policy" {
  description = "Whether to enable default key policy"
  type        = bool
  default     = true
}

variable "bypass_policy_lockout_safety_check" {
  description = "Whether to bypass key policy lockout safety checks"
  type        = bool
  default     = null
}

variable "enable_route53_dnssec" {
  description = "Enable DNSSEC policy for Route53 signing"
  type        = bool
  default     = false
}

variable "rotation_period_in_days" {
  description = "Custom key rotation period in days (90-2560)"
  type        = number
  default     = null
}

variable "policy" {
  description = "Custom key policy JSON string"
  type        = string
  default     = null
}

variable "source_policy_documents" {
  description = "List of IAM policy document strings merged for exported document"
  type        = list(string)
  default     = []
}

variable "override_policy_documents" {
  description = "List of IAM policy documents merged with override behavior"
  type        = list(string)
  default     = []
}

variable "custom_key_store_id" {
  description = "KMS Custom Key Store ID (CloudHSM)"
  type        = string
  default     = null
}

variable "key_material_base64" {
  description = "Base64 symmetric key material for external CMK"
  type        = string
  default     = null
}

variable "valid_to" {
  description = "Expiration time for imported key material"
  type        = string
  default     = null
}

variable "primary_key_arn" {
  description = "Primary ARN for replica key"
  type        = string
  default     = null
}

variable "primary_external_key_arn" {
  description = "Primary ARN for replica external key"
  type        = string
  default     = null
}

variable "key_spec" {
  description = "Key spec for AWS KMS keys"
  type        = string
  default     = null
}

variable "customer_master_key_spec" {
  description = "Customer master key spec for KMS key pairs"
  type        = string
  default     = null
}

variable "aliases" {
  description = "Static alias names to create"
  type        = list(string)
  default     = []
}

variable "aliases_use_name_prefix" {
  description = "Whether alias name is used as prefix"
  type        = bool
  default     = false
}

variable "computed_aliases" {
  description = "Computed alias definitions with name from upstream resource"
  type = map(object({
    name = string
  }))
  default = {}
}

variable "key_owners" {
  description = "IAM ARNs with full key permissions"
  type        = list(string)
  default     = []
}

variable "key_administrators" {
  description = "IAM ARNs for key administrators"
  type        = list(string)
  default     = []
}

variable "key_users" {
  description = "IAM ARNs for key users"
  type        = list(string)
  default     = []
}

variable "key_service_users" {
  description = "IAM ARNs for service users"
  type        = list(string)
  default     = []
}

variable "key_service_roles_for_autoscaling" {
  description = "IAM ARNs for AutoScaling service-linked roles"
  type        = list(string)
  default     = []
}

variable "key_symmetric_encryption_users" {
  description = "IAM ARNs for symmetric encryption users"
  type        = list(string)
  default     = []
}

variable "key_hmac_users" {
  description = "IAM ARNs for HMAC users"
  type        = list(string)
  default     = []
}

variable "key_asymmetric_public_encryption_users" {
  description = "IAM ARNs for asymmetric public encryption users"
  type        = list(string)
  default     = []
}

variable "key_asymmetric_sign_verify_users" {
  description = "IAM ARNs for asymmetric sign/verify users"
  type        = list(string)
  default     = []
}

variable "grants" {
  description = "Map of KMS grant definitions"
  type        = map(any)
  default     = {}
}

variable "route53_dnssec_sources" {
  description = "Route53 DNSSEC allowed sources"
  type = list(object({
    account_ids     = optional(list(string))
    hosted_zone_arn = optional(string)
  }))
  default = []
}

variable "key_statements" {
  description = "Custom key policy statements"
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}
