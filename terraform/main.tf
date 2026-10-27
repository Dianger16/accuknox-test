# PLANTED (IaC scan): these resources are never applied. They exist so the
# IaC scanner has findings to report.

resource "aws_s3_bucket" "public_data" {
  bucket = "lab-iac-scan-target"
}

resource "aws_s3_bucket_public_access_block" "public_data" {
  bucket                  = aws_s3_bucket.public_data.id
  block_public_acls       = false # PLANTED
  block_public_policy     = false # PLANTED
  ignore_public_acls      = false # PLANTED
  restrict_public_buckets = false # PLANTED
}

resource "aws_security_group" "wide_open" {
  name        = "lab-iac-scan-sg"
  description = "PLANTED: all ports open to the internet"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # PLANTED
  }
}

resource "aws_db_instance" "unencrypted" {
  identifier          = "lab-iac-scan-db"
  engine              = "mysql"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  username            = "admin"
  password            = "ChangeMe123!" # PLANTED: hard-coded password
  storage_encrypted   = false          # PLANTED
  publicly_accessible = true           # PLANTED
  skip_final_snapshot = true
}
