data "aws_iam_policy_document" "s3-static-policy" {
  statement {
    sid       = "PublicReadGetObject"
    effect    = "Allow"
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::pranaygurung.com/*"]

    principals {
      type        = "*"
      identifiers = ["*"]
    }
  }
}
