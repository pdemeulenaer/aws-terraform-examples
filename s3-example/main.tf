terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      # version = "~> 3.5.0"
      version = ">= 4.15.1"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "test_s3_bucket" {
  bucket_prefix = var.bucket_prefix
  acl = var.acl
  
   versioning {
    enabled = var.versioning
  }
  
  tags = var.tags
}


### FROM HERE, SSE-KMS encryption

resource "aws_s3_bucket_server_side_encryption_configuration" "sse_kms_config" {
  bucket = aws_s3_bucket.test_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.key.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_object" "test_s3_object" {
  bucket = aws_s3_bucket.test_s3_bucket.id

  key    = basename(var.upload_source)
  source = var.upload_source
  etag   = filemd5(var.upload_source)

  server_side_encryption = "aws:kms"

  depends_on = [
    aws_s3_bucket.test_s3_bucket
  ]
}