# Terraform Settings Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      # version = "~> 3.63"
      version = "~> 4.45"
    }
    helm = {
      source = "hashicorp/helm"
      #version = "2.5.1"
      version = "~> 2.5"
    }
    http = {
      source = "hashicorp/http"
      #version = "2.1.0"
      version = "~> 2.1"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.11"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "tf-inadev-states"
    key            = "apps/non-prod/inadev/terraform.tfstate"
    region         = "us-east-2"
    # dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn = "arn:aws:iam::${var.aws_account_id}:role/admin_lvl2"
  }
}

# Terraform HTTP Provider Block
provider "http" {
  # Configuration options
}