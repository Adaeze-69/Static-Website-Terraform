
provider "aws" {
  region = "us-east-1"
}

 # Module for S3 Bucket
 module "s3_bucket" {
  source = "./modules/S3_bucket"
 }

 # Module for S3 Object
  module "s3_object" {
    source = "./modules/s3-object"
  }
  
  # # Module for CloudFront
  # module "cloudfront" {
  #   source = "./modules/cloudfront"
  #   s3-bucket       = module.aws_bucket.s3-bucket
  # certificate_arn = "arn:aws:acm:region:account-id:certificate/certificate-id"
  # }
  # output "aws_cloudfront" {
  # value = aws_cloudfront_distribution.cloudfront.id
  
  # }


#   domain_name     = var.domain_name
   
   
 
# # Module for CloudFront
# module "cloudfront" {
#   source                = "./modules/cloudfront"
#   s3_bucket_name        = var.s3_bucket_name
#   domain_name           = var.domain_name
#   certificate_arn       = var.cloudfront_certificate_arn
# }

# # Module for Route 53
# module "route53" {
#   source                = "./modules/route53"
#   domain_name           = var.domain_name
#   cloudfront_domain     = module.cloudfront.cloudfront_domain_name
#   route53_zone_id       = var.route53_zone_id
# }

# # Module for IAM Permissions
# module "permissions" {
#   source                = "./modules/permissions"
#   s3_bucket_name        = var.s3_bucket_name
# }

# # Module for API Gateway
# module "api_gateway" {
#   source                = "./modules/api_gateway"
#   api_name              = var.api_name
# }

# # Module for SSL Certificate
# module "certificate" {
#   source                = "./modules/certificate"
#   domain_name           = var.domain_name
# }