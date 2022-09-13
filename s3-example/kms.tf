# Create a KMS key - CMK
resource "aws_kms_key" "key" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}