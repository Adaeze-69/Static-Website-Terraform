resource "aws_s3_object" "files_upload" {
  for_each    = fileset("modules/s3-object/home-cleaning-website-23/", "**/*.*")
  bucket      = "adaeze-terraform-bucket-23"
  key         = each.value
  source      = "modules/s3-object/home-cleaning-website-23/${each.value}"
  content_type = "html"

}