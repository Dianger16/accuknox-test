resource "aws_s3_bucket" "test_bucket" {
  bucket = "accuknox-iac-test-bucket-poc"
}

resource "aws_s3_bucket_acl" "test_bucket_acl" {
  bucket = aws_s3_bucket.test_bucket.id
  acl    = "public-read"
}

resource "aws_s3_bucket_public_access_block" "test_bucket_pab" {
  bucket                  = aws_s3_bucket.test_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
