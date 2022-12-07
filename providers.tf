terraform {
  cloud {
    organization = "hasitha84"

    workspaces {
      name = "prismacloud-tf-onboarding-demo"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    aws-sso-scim = {
      source  = "BurdaForward/aws-sso-scim"
      version = "0.5.0"
    }
    prismacloud = {
      source  = "PaloAltoNetworks/prismacloud"
      version = ">= 1.2.10, < 1.3.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}
