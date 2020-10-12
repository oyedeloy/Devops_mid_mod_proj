resource "aws_s3_bucket" "b" {
  bucket = "mid-mod-buck"
  acl    = "public"

  tags = {
    Name        = "my-mid-bucket"
    Environment = "Dev"
  }
}