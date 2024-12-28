module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.2.2"
  bucket  = "pranaygurung.com"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  website = {
    index_document = "index.html"
    error_document = "error.html"
  }
  versioning = {
    enabled = true
  }

  acl           = "public-read"
  force_destroy = true

  attach_policy = true
  # policy        = data.aws_iam_policy_document.s3-static-policy.json
  policy = <<EOF
  {
      "Version": "2012-10-17",
      "Statement": [
          {
              "Sid": "PublicReadGetObject",
              "Effect": "Allow",
              "Principal": "",
              "Action": [
                  "s3:GetObject"
              ],
              "Resource": [
                  "arn:aws:s3:::pranaygurung.com/*"
              ]
          }
      ]
  }
EOF
}

