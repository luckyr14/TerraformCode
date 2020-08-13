variable "region" {
  default = "us-east-1"
}

variable "env" {
  default = "stg"
}

variable "function_name" {
  default = "stg_thumbnail_generation"
}

variable "lambda_role_arn" {
  default = "arn:aws:iam::422626387421:role/sqswithvpc"
}

variable "handler" {
  default = "index.handler"
}

variable "memory_size" {
  type    = number
  default = 1984
}

variable "runtime" {
  default = "nodejs10.x"
}

variable "timeout" {
  type    = number
  default = 305
}

variable "lambda_env" {
  type = map
  default = {
      ENV = "stg"
  }
}

variable "s3_bucket_arn" {
  default = "arn:aws:s3:::stage-apollo.com"
}

variable "bucket_name" {
  default = "stage-apollo.com"
}