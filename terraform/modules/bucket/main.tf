resource "aws_s3_bucket" "bucket" {
  bucket = "${var.bucket_name}-${var.owner}"
  tags = {
    owner      = var.owner
    createdBy  = "terraform"
    modulePath = path.module
    CWD        = path.cwd
  }
}
