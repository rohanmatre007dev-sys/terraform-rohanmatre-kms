terraform {
  required_version = ">= 1.5.7"
}

provider "aws" {
  region = "ap-south-1"
}

module "kms" {
  source = "../../"

  environment = "dev"
  description = "Basic wrapper KMS key"
  key_usage   = "ENCRYPT_DECRYPT"
  tags = {
    Example = "basic"
  }
}
