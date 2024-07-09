provider "aws" {
  region = "your_aws_region"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "your-unique-bucket-name"
  acl    = "private"

  tags = {
    Name        = "My Bucket"
    Environment = "Production"
  }

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = false  # Set to true to prevent accidental deletion
  }

  # Optional: Bucket policy for public read access
  # Uncomment and modify as needed
  # policy = <<POLICY
  # {
  #   "Version": "2012-10-17",
  #   "Statement": [
  #     {
  #       "Effect": "Allow",
  #       "Principal": "*",
  #       "Action": [
  #         "s3:GetObject"
  #       ],
  #       "Resource": [
  #         "${aws_s3_bucket.my_bucket.arn}/*"
  #       ]
  #     }
  #   ]
  # }
  # POLICY
}

output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

output "bucket_region" {
  value = aws_s3_bucket.my_bucket.region
}

output "bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}
