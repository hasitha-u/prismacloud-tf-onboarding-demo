terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    prismacloud = {
      source  = "PaloAltoNetworks/prismacloud"
      version = ">= 1.2.10, < 1.3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
  alias  = "sub-account"

  assume_role {
    # Switch into the account we created in this module
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/${aws_organizations_account.account.role_name}"
  }
}