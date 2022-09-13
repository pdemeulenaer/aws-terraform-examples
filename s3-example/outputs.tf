output "s3_bucket_name" {
  value = aws_s3_bucket.test_s3_bucket.id
}

output "s3_bucket_region" {
    value = aws_s3_bucket.test_s3_bucket.region
}