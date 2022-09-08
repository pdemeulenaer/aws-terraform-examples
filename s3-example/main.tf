terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "test-s3-bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}