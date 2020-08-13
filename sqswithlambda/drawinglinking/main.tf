provider "aws" {
  region = "us-east-1"
}

module "sqs" {
	source = "/mnt/c/Users/Lakshman.Singh/Desktop/terraform/terraformscript/sqswithlambda/module/sqs"
	region = "us-east-1"
	env = "stg"
	sqsname = "stg_apollo_construct_drawing_linking"
    visibility_timeout_seconds = 305
    message_retention_seconds = 345600
    max_message_size = 262144 
	delay_seconds = 0 
	receive_wait_time_seconds = 0
	sqsmaxReceiveCount = 1
	dlqname = "stg_apollo_construct_drawing_linking_dlq" 
	dlq_visibility_timeout_seconds = 245
	dlq_message_retention_seconds = 1209600
	dlq_max_message_size = 262144
	dlq_delay_seconds = 0
	dlq_receive_wait_time_seconds = 0
}

module "lambda" {
	source = "/mnt/c/Users/Lakshman.Singh/Desktop/terraform/terraformscript/sqswithlambda/module/lambda"
	region = "us-east-1"
	env = "stg"
	function_name = "stg_apollo_construct_drawing_linking"
	filenamelocation = "drawinglinking.zip"
    lambda_role_arn = "arn:aws:iam::422626387421:role/sqswithvpc"
    handler = "Script.lambda_handler" 
    memory_size = 960
	runtime = "python2.7" 
	timeout = 303 
	subnets = ["subnet-0cf54241057a90cef", "subnet-0da59dbed859ff69b", "subnet-01883476659580454"]
	security_groups = ["sg-0f52d24d139c9fe54"] 
	lambda_env = var.lambda_env
	source_arn = "${module.sqs.sqs_arn}"
}

variable "lambda_env" {
  type = map
  default = {
      REDIS_HOST = "stg-redis-pdf-annotation.mirxzd.ng.0001.use1.cache.amazonaws.com"
      sqs_url = "https://sqs.us-east-1.amazonaws.com/422626387421/stg_apollo_construct_drawing_linking_dlq"
  }
}

module "dlq_lambda" {
	source = "/mnt/c/Users/Lakshman.Singh/Desktop/terraform/terraformscript/sqswithlambda/module/lambda"
	region = "us-east-1"
	env = "stg"
	function_name = "stg_apollo_construct_drawing_linking_dlq"
	filenamelocation = "drawinglinkingdlq.zip"
    lambda_role_arn = "arn:aws:iam::422626387421:role/sqswithvpc"
    handler = "Script.lambda_handler" 
    memory_size = 960
	runtime = "python2.7" 
	timeout = 243
	subnets = ["subnet-0cf54241057a90cef", "subnet-0da59dbed859ff69b", "subnet-01883476659580454"]
	security_groups = ["sg-0f52d24d139c9fe54"] 
	lambda_env = var.lambda_env_dlq
	source_arn = "${module.sqs.sqs_dlq_arn}"
}

variable "lambda_env_dlq" {
  type = map
  default = {
      REDIS_HOST = "stg-redis-pdf-annotation.mirxzd.ng.0001.use1.cache.amazonaws.com"
      sqs_url = "https://sqs.us-east-1.amazonaws.com/422626387421/stg_apollo_construct_drawing_linking_dlq"
  }
}