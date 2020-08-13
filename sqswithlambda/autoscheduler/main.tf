provider "aws" {
  region = "us-east-1"
}

module "sqs" {
	source = "/mnt/c/Users/Lakshman.Singh/Desktop/terraform/terraformscript/sqswithlambda/module/sqs"
	region = "us-east-1"
	env = "stg"
	sqsname = "stg_apollo_construct_auto_scheduling"
    visibility_timeout_seconds = 901
    message_retention_seconds = 345600
    max_message_size = 262144 
	delay_seconds = 0 
	receive_wait_time_seconds = 2
	sqsmaxReceiveCount = 1 
	dlqname = "stg_apollo_construct_auto_scheduling_dlq" 
	dlq_visibility_timeout_seconds = 30
	dlq_message_retention_seconds = 1209600
	dlq_max_message_size = 262144
	dlq_delay_seconds = 0
	dlq_receive_wait_time_seconds = 0
}

module "lambda" {
	source = "/mnt/c/Users/Lakshman.Singh/Desktop/terraform/terraformscript/sqswithlambda/module/novpclambda"
	region = "us-east-1"
	env = "stg"
	function_name = "stg_apollo_construct_auto_scheduling"
    lambda_role_arn = "arn:aws:iam::422626387421:role/sqswithvpc"
    handler = "Script.start_the_process" 
    memory_size = 3008
	runtime = "python2.7" 
	timeout = 900 
	lambda_env = var.lambda_env
	source_arn = "${module.sqs.sqs_arn}"
}

variable "lambda_env" {
  type = map
  default = {
      foo = "bar"
      user = "Alice"
  }
}