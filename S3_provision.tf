resource "aws_s3_bucket" "b" {
  bucket = "mid-mod-buck"
  acl    = "private"

  tags = {
    Name        = "my new buck"
    Environment = "Dev"
  }
}