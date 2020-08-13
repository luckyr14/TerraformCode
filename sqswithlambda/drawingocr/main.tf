provider "aws" {
  region = "us-east-1"
}

module "sqs" {
	source = "/mnt/c/Users/Lakshman.Singh/Desktop/terraform/terraformscript/sqswithlambda/module/sqs"
	region = "us-east-1"
	env = "stg"
	sqsname = "stg_apollo_construct_drawing_ocr"
    visibility_timeout_seconds = 31
    message_retention_seconds = 345600
    max_message_size = 262144 
	delay_seconds = 0 
	receive_wait_time_seconds = 0
	sqsmaxReceiveCount = 1
	dlqname = "stg_apollo_construct_drawing_ocr_dlq" 
	dlq_visibility_timeout_seconds = 0
	dlq_message_retention_seconds = 1209600
	dlq_max_message_size = 262144
	dlq_delay_seconds = 0
	dlq_receive_wait_time_seconds = 0
}

module "lambda" {
	source = "/mnt/c/Users/Lakshman.Singh/Desktop/terraform/terraformscript/sqswithlambda/module/lambda"
	region = "us-east-1"
	env = "stg"
	function_name = "stg_apollo_construct_drawing_ocr"
	filenamelocation = "drawingsocr.zip"
    lambda_role_arn = "arn:aws:iam::422626387421:role/sqswithvpc"
    handler = "index.handler" 
    memory_size = 3008
	runtime = "nodejs10.x" 
	timeout = 30
	subnets = ["subnet-0cf54241057a90cef", "subnet-0da59dbed859ff69b", "subnet-01883476659580454"]
	security_groups = ["sg-0f52d24d139c9fe54"] 
	lambda_env = var.lambda_env
	source_arn = "${module.sqs.sqs_arn}"
}

variable "lambda_env" {
  type = map
  default = {
      BUCKET_NAME = "stage-apollo.com"
      GOOGLE_APPLICATION_CREDENTIALS = "https://stage-apollo.com.s3.amazonaws.com/Katerra_Construct-f5c7e5766e65.json"
	  REDIS_ENDPOINT = "stg-redis-pdf-annotation.mirxzd.ng.0001.use1.cache.amazonaws.com"
	  UPDATE_OCR_ENDPOINT = "'--1--'"
  }
}