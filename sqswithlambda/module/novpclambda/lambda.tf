resource "aws_lambda_function" "lambda" {
  
  function_name                  = var.function_name
  role                           = var.lambda_role_arn
  handler                        = var.handler
  memory_size                    = var.memory_size
  runtime                        = var.runtime
  timeout                        = var.timeout
  filename                       = var.filenamelocation
  
  environment  {
    variables = var.lambda_env
  }
}

resource "aws_lambda_event_source_mapping" "event_source_mapping" {
  batch_size        = 1
  event_source_arn  = var.source_arn
  enabled           = true
  function_name     = aws_lambda_function.lambda.function_name
}

output "lambda_arn" {
value = "${aws_lambda_function.lambda.arn}"
}