variable "aws_region" {
  description = "AWS region where the S3 bucket will be created"
  default     = "us-east-1"  # Replace with your desired AWS region
}

variable "bucket_name" {
  description = "Name of the S3 bucket to be created"
}

variable "tags" {
  type    = map(string)
  default = {
    Name        = "My Bucket"
    Environment = "Production"
  }
}
