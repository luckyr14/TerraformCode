resource "aws_s3_bucket" "apolloclient" {
  bucket              = var.bucketname
  region              = var.region
  policy = <<EOF
{
"Version": "2008-10-17",
"Id": "PolicyForCloudFrontPrivateContent",
"Statement": [
				{
					"Sid": "1",
					"Effect": "Allow",
					"Principal": {
									"AWS": "arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity E3S42V99AAGQ19"
								},
					"Action": "s3:GetObject",
					"Resource": "arn:aws:s3:::${var.bucketname}/*"
				}
			]
}
EOF

  tags = {
    Name        = "var.env"
  }

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
versioning {
          enabled = true
  }

cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["PUT", "POST", "GET", "HEAD"]
    allowed_origins = ["https://*", "http://*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}
