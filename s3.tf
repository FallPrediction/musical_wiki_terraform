resource "aws_s3_bucket" "app_revision_bucket" {
  bucket        = var.app_revision_bucket
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "app_revision_bucket_versioning" {
  bucket = aws_s3_bucket.app_revision_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket" "app_media_bucket" {
  bucket        = var.app_media_bucket
  force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "app_media_bucket" {
  bucket = aws_s3_bucket.app_media_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "app_media_bucket" {
  bucket = aws_s3_bucket.app_media_bucket.id
  policy = data.aws_iam_policy_document.app_media_bucket.json
}

resource "aws_s3_bucket_ownership_controls" "app_media_bucket" {
  bucket = aws_s3_bucket.app_media_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "app_media_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.app_media_bucket,
    aws_s3_bucket_public_access_block.app_media_bucket,
  ]

  bucket = aws_s3_bucket.app_media_bucket.id
  acl    = "public-read"
}
