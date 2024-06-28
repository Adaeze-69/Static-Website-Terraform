resource "aws_s3_bucket" "adaeze-terraform-bucket-23" {
  bucket = "adaeze-terraform-bucket-23"
#  force_destroy = true 
}
resource "aws_s3_bucket_public_access_block" "block_access" {
  bucket = "adaeze-terraform-bucket-23"
  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
  
}   


resource "aws_s3_bucket_website_configuration" "website-config" {
  bucket = "adaeze-terraform-bucket-23"

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
} 



resource "aws_s3_bucket_policy" "allow_access_from_another_account" {
  bucket = "adaeze-terraform-bucket-23"
  policy = data.aws_iam_policy_document.allow_access_from_another_account.json
}

data "aws_iam_policy_document" "allow_access_from_another_account" {
  statement {
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket",
    ]

    resources = [
      aws_s3_bucket.adaeze-terraform-bucket-23.arn,
      "${aws_s3_bucket.adaeze-terraform-bucket-23.arn}/*",
    ]
  }
}