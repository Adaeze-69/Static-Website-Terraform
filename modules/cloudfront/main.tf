# resource "aws_s3_bucket" "adaeze-terraform-bucket-23" {
#   bucket = "adaeze-terraform-bucket-23"
#   force_destroy = true
#   tags = {
#     Name = "adaeze-terraform-bucket-23"
#   }


# }

# # resource "aws_s3_bucket_acl" "adaeze-terraform-bucket-23_acl" {
# #   bucket = aws_s3_bucket.adaeze-terraform-bucket-23.id
# #   acl    = "private"
# # }

# # locals {
# #   s3_origin_id = "myS3Origin"
# # }

# resource "aws_cloudfront_distribution" "s3_distribution" {
#   origin {
#     domain_name              = aws_s3_bucket.adaeze-terraform-bucket-23.bucket_regional_domain_name
#     # origin_access_control_id = aws_cloudfront_origin_access_control.default.id
#     origin_id                = "s3-adaeze-terraform-bucket-23"
  


#   s3_origin_config {

#     origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
#   }
#   }

#   enabled             = true
#   is_ipv6_enabled     = true
#   comment             = "CloudFront distribution for adaeze-terraform-bucket-23"
#   default_root_object = "index.html"

 

#   # aliases = "aws_s3_bucket.adaeze-terraform-bucket-23.us-east-1.amazonaws.com"

#   default_cache_behavior {
#     allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "adaeze-terraform-bucket-23"

#     forwarded_values {
#       query_string = false

#       cookies {
#         forward = "none"
#       }
#     }

#     viewer_protocol_policy = "allow-all"
#     min_ttl                = 0
#     default_ttl            = 3600
#     max_ttl                = 86400
#   }

#   # Cache behavior with precedence 0
#   ordered_cache_behavior {
#     path_pattern     = "/content/immutable/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
#     cached_methods   = ["GET", "HEAD", "OPTIONS"]
#     target_origin_id = "adaeze-terraform-bucket-23"

#     forwarded_values {
#       query_string = false
#       headers      = ["Origin"]

#       cookies {
#         forward = "none"
#       }
#     }

#     min_ttl                = 0
#     default_ttl            = 3600
#     max_ttl                = 86400
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }

#   # Cache behavior with precedence 1
#   ordered_cache_behavior {
#     path_pattern     = "/content/*"
#     allowed_methods  = ["GET", "HEAD", "OPTIONS"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = "adaeze-terraform-bucket-23"
#     forwarded_values {
#       query_string = false

#       cookies {
#         forward = "none"
#       }
#     }

#     min_ttl                = 0
#     default_ttl            = 3600
#     max_ttl                = 86400
#     compress               = true
#     viewer_protocol_policy = "redirect-to-https"
#   }

#   price_class = "PriceClass_100"

#   restrictions {
#     geo_restriction {
#       restriction_type = "none"
#     }
#   }


#   viewer_certificate {
#     cloudfront_default_certificate = true
#   }
# }

# # Create a CloudFront origin access identity
# resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
#   comment = "Origin Access Identity for adaeze-terraform-bucket-23"
# }

# # Attach bucket policy to allow CloudFront access
# resource "aws_s3_bucket_policy" "bucket_policy" {
#   bucket = aws_s3_bucket.adaeze-terraform-bucket-23.id

#   policy = jsonencode({
#     Version = "2012-10-17",
#     Statement = [
#       {
#         Effect = "Allow",
#         Principal = {
#           AWS = aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn
#         }
#         Action = "s3:GetObject"
#       Resource = [

#         "${aws_s3_bucket.adaeze-terraform-bucket-23.arn}/*"
#         ]
#       }
#     ]
#   })
# }