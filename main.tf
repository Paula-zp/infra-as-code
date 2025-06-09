#main.tf
#defining the provider as aws
provider "aws" {
    region     = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    token      = "${var.session_token}"
}

# Create an S3 Bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = "bucket-da-paulinha"
  force_destroy = true
  tags = {
    Environment = "Dev"
    Owner       = "Paula"
  }
}

