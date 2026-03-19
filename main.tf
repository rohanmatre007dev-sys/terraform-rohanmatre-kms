################################################################################
# Wrapper for terraform-aws-modules/kms/aws
################################################################################

module "kms" {
  source  = "terraform-aws-modules/kms/aws"
  version = ">= 4.2.0"

  create                             = var.create
  create_external                    = var.create_external
  create_replica                     = var.create_replica
  create_replica_external            = var.create_replica_external
  description                        = var.description
  key_usage                          = var.key_usage
  is_enabled                         = var.is_enabled
  multi_region                       = var.multi_region
  enable_key_rotation                = var.enable_key_rotation
  deletion_window_in_days            = var.deletion_window_in_days
  enable_default_policy              = var.enable_default_policy
  bypass_policy_lockout_safety_check = var.bypass_policy_lockout_safety_check
  enable_route53_dnssec              = var.enable_route53_dnssec
  rotation_period_in_days            = var.rotation_period_in_days
  policy                             = var.policy
  source_policy_documents            = var.source_policy_documents
  override_policy_documents          = var.override_policy_documents
  key_material_base64                = var.key_material_base64
  valid_to                           = var.valid_to
  primary_key_arn                    = var.primary_key_arn
  primary_external_key_arn           = var.primary_external_key_arn
  key_spec                           = var.key_spec
  customer_master_key_spec           = var.customer_master_key_spec
  custom_key_store_id                = var.custom_key_store_id

  aliases                 = var.aliases
  aliases_use_name_prefix = var.aliases_use_name_prefix
  computed_aliases        = var.computed_aliases

  key_owners                             = var.key_owners
  key_administrators                     = var.key_administrators
  key_users                              = var.key_users
  key_service_users                      = var.key_service_users
  key_service_roles_for_autoscaling      = var.key_service_roles_for_autoscaling
  key_symmetric_encryption_users         = var.key_symmetric_encryption_users
  key_hmac_users                         = var.key_hmac_users
  key_asymmetric_public_encryption_users = var.key_asymmetric_public_encryption_users
  key_asymmetric_sign_verify_users       = var.key_asymmetric_sign_verify_users
  key_statements                         = var.key_statements

  grants                 = var.grants
  route53_dnssec_sources = var.route53_dnssec_sources
  tags                   = local.tags

  region = var.region
}
