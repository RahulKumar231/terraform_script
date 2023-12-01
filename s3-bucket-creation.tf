provider "aws" {
  profile    = "terraform_user"
  access_key = "AKIAX6IHJJN7IQGNP4GF"
  secret_key = "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"
  region     = "eu-west-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-test-bucket-2310-rah-rit-2023" # unique name we have to provide
  tags = {
    Name        = "MyBucket"
    Environment = "Test"
  }
}
