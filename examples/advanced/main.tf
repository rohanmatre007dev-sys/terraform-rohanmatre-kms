terraform {
  required_version = ">= 1.5.7"
}

provider "aws" {
  region = "ap-south-1"
}

module "kms" {
  source = "../../"

  environment             = "prod"
  description             = "Advanced key example"
  key_usage               = "ENCRYPT_DECRYPT"
  enable_key_rotation     = true
  deletion_window_in_days = 7
  aliases                 = ["example/advanced"]
  tags = {
    Example = "advanced"
  }
}
