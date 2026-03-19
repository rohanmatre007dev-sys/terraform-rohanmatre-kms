# terraform-rohanmatre-kms

Terraform wrapper module for AWS KMS built on top of [terraform-aws-modules/kms/aws](https://registry.terraform.io/modules/terraform-aws-modules/kms/aws).

This wrapper currently forwards the inputs to the upstream module and adds runtime-managed tags:
- Environment
- ManagedBy
- GitHubRepo

## Usage

### Basic example

```hcl
module "kms" {
  source = "./../terraform-rohanmatre-kms"

  environment = "dev"
  description = "Dev CMK"
  key_usage   = "ENCRYPT_DECRYPT"

  tags = {
    Project = "demo"
  }
}
```

### External key example

```hcl
module "kms" {
  source = "./../terraform-rohanmatre-kms"

  environment          = "dev"
  create_external      = true
  key_material_base64  = "Wblj06fduthWggmsT0cLVoIMOkeLbc2kVfMud77i/JY="
  valid_to             = "2085-04-12T23:20:50.52Z"
  key_usage            = "ENCRYPT_DECRYPT"
  key_owners           = ["arn:aws:iam::012345678901:role/owner"]
  key_administrators   = ["arn:aws:iam::012345678901:role/admin"]
  key_users            = ["arn:aws:iam::012345678901:role/user"]
  key_service_users    = ["arn:aws:iam::012345678901:role/ec2-role"]
  aliases              = ["mycompany/external"]
  aliases_use_name_prefix = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

## Outputs

- `key_arn`
- `key_id`
- `key_policy`
- `key_region`
- `aliases`
- `external_key_state`
- `external_key_usage`
- `grants`

## Requirements

- terraform >= 1.5.7
- aws provider >= 6.28

## Notes

This wrapper is primarily a pass-through to the upstream module. It is safe to set the same arguments as the upstream KMS module and consume outputs from this module as shown above.
