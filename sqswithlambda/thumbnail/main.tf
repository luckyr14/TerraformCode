provider "aws" {
  region = "us-east-1"
}

resource "aws_lambda_function" "lambda" {
  function_name                  = var.function_name
  role                           = var.lambda_role_arn
  handler                        = var.handler
  memory_size                    = var.memory_size
  runtime                        = var.runtime
  timeout                        = var.timeout
  filename                       = "thumbnail.zip"
  
  environment  {
    variables = var.lambda_env
  }
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = "AllowExecutionFromBucket"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.lambda.arn}"
  principal     = "s3.amazonaws.com"
  source_arn    = var.s3_bucket_arn
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = var.bucket_name
  lambda_function {
    lambda_function_arn = "${aws_lambda_function.lambda.arn}"
    events              = ["s3:ObjectCreated:*"]
   }
}